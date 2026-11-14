#!/usr/bin/env python3
"""Resource-aware, resumable Desktop campaign runner.

Commands are argv arrays (never shell strings).  The runner validates the lane
DAG, schedules within CPU/GPU capacity, records input/output/tool hashes and
telemetry, resumes only checksum-identical successes, and writes an immutable
result archive.  It performs no Git or network mutation.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import signal
import subprocess
import tarfile
import threading
import time
import gzip
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path


def digest(path: Path) -> str:
    if path.is_symlink():
        raise ValueError(f"campaign paths may not be symlinks: {path}")
    h = hashlib.sha256()
    if path.is_dir():
        for child in sorted(p for p in path.rglob("*") if p.is_file()):
            if child.is_symlink():
                raise ValueError(f"campaign paths may not be symlinks: {child}")
            h.update(child.relative_to(path).as_posix().encode() + b"\0")
            h.update(bytes.fromhex(digest(child)))
    else:
        with path.open("rb") as stream:
            for block in iter(lambda: stream.read(1 << 20), b""):
                h.update(block)
    return h.hexdigest()


def atomic_json(path: Path, value: dict) -> None:
    temporary = path.with_suffix(path.suffix + ".new")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def validate(config: dict) -> None:
    if config.get("version") != 1 or not config.get("campaign") or not config.get("lanes"):
        raise ValueError("invalid campaign header")
    names = [lane.get("name") for lane in config["lanes"]]
    if len(names) != len(set(names)) or any(not name for name in names):
        raise ValueError("lane names must be unique and non-empty")
    known = set(names)
    graph = {lane["name"]: set(lane.get("depends_on", [])) for lane in config["lanes"]}
    if any(not deps <= known for deps in graph.values()):
        raise ValueError("unknown lane dependency")
    pending = dict(graph)
    while pending:
        ready = {name for name, deps in pending.items() if not (deps & pending.keys())}
        if not ready:
            raise ValueError("campaign dependency cycle")
        for name in ready:
            pending.pop(name)
    for lane in config["lanes"]:
        if lane.get("resource") not in {"cpu", "gpu", "mixed"}:
            raise ValueError(f"invalid resource for {lane['name']}")
        if not isinstance(lane.get("command"), list) or not lane["command"]:
            raise ValueError(f"invalid command for {lane['name']}")
        if lane.get("cpus", 0) > 32 or lane.get("gpu", 0) > 1:
            raise ValueError(f"resource request too large for {lane['name']}")
        gpu_request = float(lane.get("gpu", 0))
        if gpu_request < 0 or (gpu_request and round(gpu_request * 1000) == 0) or abs(gpu_request * 1000 - round(gpu_request * 1000)) > 1e-9:
            raise ValueError(f"GPU request must be 0 or integer thousandths for {lane['name']}")
        command_tokens = {Path(token).name.lower() for token in lane["command"]}
        if command_tokens & {"git", "git.exe", "gh", "gh.exe"}:
            raise ValueError(f"repository/network mutation command forbidden in {lane['name']}")
        if lane.get("retries", 0) not in range(0, 4):
            raise ValueError(f"retries must be 0..3 for {lane['name']}")
        if any(any(marker in key.upper() for marker in ("TOKEN", "SECRET", "PASSWORD", "API_KEY", "PRIVATE_KEY"))
               for key in lane.get("environment", {})):
            raise ValueError(f"secret-like environment key forbidden in {lane['name']}")


def hashes(root: Path, paths: list[str]) -> dict[str, str]:
    result = {}
    for relative in paths:
        path = (root / relative).resolve()
        path.relative_to(root)
        if not path.exists():
            raise ValueError(f"missing campaign path: {relative}")
        result[relative] = digest(path)
    return result


class Resources:
    def __init__(self, cpus: int, gpu: float) -> None:
        self.total_cpu, self.free_cpu = cpus, cpus
        self.total_gpu, self.free_gpu = round(gpu * 1000), round(gpu * 1000)
        self.cv = threading.Condition()

    def acquire(self, cpu: int, gpu: float) -> None:
        gpu_units = round(gpu * 1000)
        with self.cv:
            self.cv.wait_for(lambda: self.free_cpu >= cpu and self.free_gpu >= gpu_units)
            self.free_cpu -= cpu
            self.free_gpu -= gpu_units

    def release(self, cpu: int, gpu: float) -> None:
        gpu_units = round(gpu * 1000)
        with self.cv:
            self.free_cpu += cpu
            self.free_gpu += gpu_units
            self.cv.notify_all()


def telemetry(stop: threading.Event, path: Path) -> None:
    with path.open("a") as out:
        while not stop.wait(5):
            sample = {"time": time.time()}
            try:
                sample["loadavg"] = Path("/proc/loadavg").read_text().strip()
            except OSError:
                pass
            try:
                proc = subprocess.run([
                    "nvidia-smi", "--query-gpu=utilization.gpu,memory.used,power.draw,temperature.gpu",
                    "--format=csv,noheader,nounits"], capture_output=True, text=True, timeout=3)
                if proc.returncode == 0:
                    sample["gpu"] = proc.stdout.strip()
            except (OSError, subprocess.TimeoutExpired):
                pass
            out.write(json.dumps(sample, sort_keys=True) + "\n"); out.flush()


def run_process(command: list[str], root: Path, env: dict[str, str], timeout: int):
    process = subprocess.Popen(command, cwd=root, env=env, stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE, text=True, start_new_session=True)
    try:
        stdout, stderr = process.communicate(timeout=timeout)
    except subprocess.TimeoutExpired as exc:
        os.killpg(process.pid, signal.SIGKILL)
        stdout, stderr = process.communicate()
        raise subprocess.TimeoutExpired(command, timeout, stdout or exc.stdout,
                                        stderr or exc.stderr) from exc
    return subprocess.CompletedProcess(command, process.returncode, stdout, stderr)


def execute_lane(root: Path, lane: dict, timeout: int, resources: Resources,
                 previous: dict | None, state_path: Path, shared_state: dict,
                 lock: threading.Lock) -> dict:
    cpu = lane.get("cpus", 0 if lane["resource"] == "gpu" else 1)
    gpu = float(lane.get("gpu", 1 if lane["resource"] == "gpu" else 0))
    input_hashes = hashes(root, lane.get("inputs", []))
    if previous and previous.get("state") == "succeeded" and previous.get("inputs") == input_hashes:
        try:
            if previous.get("outputs") == hashes(root, lane.get("outputs", [])):
                return previous | {"resumed": True}
        except ValueError:
            pass
    resources.acquire(cpu, gpu)
    started = time.time()
    env = dict(os.environ)
    for key in list(env):
        upper = key.upper()
        if any(marker in upper for marker in ("TOKEN", "SECRET", "PASSWORD", "API_KEY", "PRIVATE_KEY")):
            env.pop(key, None)
    env.update({"OMP_NUM_THREADS": str(max(1, cpu)), "MKL_NUM_THREADS": str(max(1, cpu)),
                "OPENBLAS_NUM_THREADS": str(max(1, cpu)), "GIT_TERMINAL_PROMPT": "0",
                "GIT_CONFIG_NOSYSTEM": "1", "GIT_CONFIG_GLOBAL": os.devnull,
                "GIT_DIR": str(root / ".desktop-no-git")})
    if gpu > 0:
        env["DECOMP_GPU_FRACTION"] = str(gpu)
    env.update({str(key): str(value) for key, value in lane.get("environment", {}).items()})
    if lane.get("seeds"):
        env["DECOMP_CAMPAIGN_SEEDS"] = ",".join(map(str, lane["seeds"]))
    if gpu <= 0:
        env["CUDA_VISIBLE_DEVICES"] = ""
    executable = shutil.which(lane["command"][0], path=env.get("PATH"))
    tool_hash = digest(Path(executable)) if executable and Path(executable).is_file() else None
    record = {"state": "running", "started": started, "inputs": input_hashes,
              "command": lane["command"], "cpus": cpu, "gpu": gpu,
              "tool_sha256": tool_hash, "attempts": 0}
    with lock:
        shared_state["lanes"][lane["name"]] = record
        shared_state["heartbeat"] = time.time(); atomic_json(state_path, shared_state)
    try:
        proc = None
        lane_timeout = min(timeout, int(lane.get("timeout_seconds", timeout)))
        for attempt in range(lane.get("retries", 0) + 1):
            record["attempts"] = attempt + 1
            try:
                proc = run_process(lane["command"], root, env, lane_timeout)
            except subprocess.TimeoutExpired:
                if attempt >= lane.get("retries", 0):
                    raise
                continue
            if proc.returncode == 0:
                break
        assert proc is not None
        record.update(state="succeeded" if proc.returncode == 0 else "failed",
                      exit_code=proc.returncode, stdout=proc.stdout[-20000:],
                      stderr=proc.stderr[-20000:], finished=time.time())
        if proc.returncode == 0:
            record["outputs"] = hashes(root, lane.get("outputs", []))
    except subprocess.TimeoutExpired as exc:
        record.update(state="timed_out", exit_code=None,
                      stdout=(exc.stdout or "")[-20000:], stderr=(exc.stderr or "")[-20000:],
                      finished=time.time())
    finally:
        resources.release(cpu, gpu)
    with lock:
        shared_state["lanes"][lane["name"]] = record
        shared_state["heartbeat"] = time.time(); atomic_json(state_path, shared_state)
    return record


def archive_results(root: Path, config: dict, state_path: Path, output: Path) -> dict:
    files = {state_path.relative_to(root).as_posix(): digest(state_path)}
    for lane in config["lanes"]:
        for relative in lane.get("outputs", []):
            path = root / relative
            if path.is_file():
                files[relative] = digest(path)
            elif path.is_dir():
                for child in sorted(item for item in path.rglob("*") if item.is_file()):
                    files[child.relative_to(root).as_posix()] = digest(child)
    manifest = output.with_suffix(".manifest.json")
    atomic_json(manifest, {"version": 1, "campaign": config["campaign"], "files": files,
                           "results": config.get("results", "results.jsonl"),
                           "input_revision": config.get("input_revision"),
                           "created_epoch": int(os.environ.get("SOURCE_DATE_EPOCH", "0"))})

    def add(archive: tarfile.TarFile, source: Path, name: str) -> None:
        info = archive.gettarinfo(str(source), arcname=name)
        if not info.isfile():
            raise ValueError(f"artifact member is not a regular file: {source}")
        info.uid = info.gid = 0; info.uname = info.gname = ""; info.mtime = 0
        info.mode = 0o644
        with source.open("rb") as stream:
            archive.addfile(info, stream)

    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("wb") as raw, gzip.GzipFile(filename="", fileobj=raw, mode="wb", mtime=0) as compressed:
        with tarfile.open(fileobj=compressed, mode="w") as archive:
            add(archive, manifest, "artifact-manifest.json")
            for relative in sorted(files):
                add(archive, root / relative, relative)
    return {"archive": str(output), "sha256": digest(output), "files": len(files)}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("config", type=Path)
    ap.add_argument("--root", type=Path, default=Path("."))
    ap.add_argument("--state", type=Path, default=Path("campaign-state.json"))
    ap.add_argument("--archive", type=Path, default=Path("campaign-results.tar.gz"))
    ap.add_argument("--cpus", type=int, default=os.cpu_count() or 1)
    ap.add_argument("--gpu", type=float, default=1.0)
    args = ap.parse_args()
    root = args.root.resolve(); config = json.loads(args.config.read_text()); validate(config)
    state_path = (root / args.state).resolve()
    old = json.loads(state_path.read_text()) if state_path.exists() else {"lanes": {}}
    state = {"version": 1, "campaign": config["campaign"], "lanes": {}, "heartbeat": time.time()}
    resources, lock = Resources(min(32, args.cpus), args.gpu), threading.Lock()
    stop = threading.Event(); monitor = threading.Thread(target=telemetry, args=(stop, root / "telemetry.jsonl"), daemon=True); monitor.start()
    lanes = {lane["name"]: lane for lane in config["lanes"]}
    pending, running, complete = set(lanes), {}, {}
    deadline = time.time() + config["timeout_seconds"]
    try:
        with ThreadPoolExecutor(max_workers=len(lanes)) as pool:
            while pending or running:
                failed = {name for name, result in complete.items() if result["state"] != "succeeded"}
                for name in list(pending):
                    deps = set(lanes[name].get("depends_on", []))
                    if deps & failed:
                        complete[name] = {"state": "skipped", "reason": "dependency failed"}; pending.remove(name)
                    elif deps <= complete.keys():
                        remaining = max(1, int(deadline - time.time()))
                        running[name] = pool.submit(execute_lane, root, lanes[name], remaining,
                                                    resources, old.get("lanes", {}).get(name),
                                                    state_path, state, lock)
                        pending.remove(name)
                for name, future in list(running.items()):
                    if future.done():
                        complete[name] = future.result(); running.pop(name)
                if time.time() >= deadline and running:
                    raise TimeoutError("campaign deadline reached")
                time.sleep(.1)
    finally:
        stop.set(); monitor.join(timeout=6)
    state["lanes"] = complete; state["finished"] = time.time(); atomic_json(state_path, state)
    report = archive_results(root, config, state_path, (root / args.archive).resolve())
    report["states"] = {name: value["state"] for name, value in complete.items()}
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0 if all(value["state"] == "succeeded" for value in complete.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
