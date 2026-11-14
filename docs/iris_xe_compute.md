# Transfer Iris Xe advisory compute lane

Transfer exposes an Intel Iris Xe through Windows Direct3D 12. WSL has
`/dev/dxg`, but it does not have a Linux DRM/OpenCL device. The supported lane
therefore runs ONNX Runtime's DirectML provider in an isolated Windows Python
environment while WSL remains responsible for feature construction,
orchestration, verification, and all compiler/matcher decisions.

This lane never reads a ROM or C source and never emits instructions. It only
orders pre-compile candidates. A candidate receives credit solely after the
original CPU compiler and byte matcher reproduce the retail bytes.

## Components

- `tools/iris_xe_directml_worker.py` is the isolated Windows tensor worker.
  DirectML sessions disable CPU execution-provider fallback, use sequential
  execution, and reject unverified paths, hashes, tensor names, dtypes, shapes,
  oversized arrays, non-finite values, and nondeterministic output.
- `tools/iris_xe_lane.py` is the WSL controller. It hashes every request,
  compares DirectML with the same ONNX model on ORT CPU, verifies canonical
  candidate ordering and top-k set parity, and enables routing only after both
  correctness and measured warm-throughput gates pass.
- `results/iris-xe-smoke-report.json` records the current hardware gate.
- `tools/export_gpu_surrogate_onnx.py` exports the shared PyTorch ranker as a
  Gather-plus-reduction ONNX graph, constructs its tensors in WSL, and writes a
  PyTorch reference. `results/iris-xe-surrogate-report.json` records three-way
  PyTorch/ORT-CPU/DirectML parity on an actual ranker artifact.

The Windows environment is intentionally outside the repository:

```text
C:\N64Decomp\venvs\iris-xe
```

It contains pinned `onnxruntime-directml` plus NumPy. `onnx` is needed only by
the smoke-model generator and can be separated from the production worker once
the real surrogate exporter is connected.

## Reproduce

```sh
python3 tools/iris_xe_lane.py probe
python3 tools/iris_xe_lane.py smoke --rows 65536 --repeats 6 \
  --output results/iris-xe-smoke-report.json
python3 -m unittest -v tests.test_iris_xe_lane
```

On the initial validated run, DirectML was selected first with CPU fallback
disabled, both providers were bitwise deterministic across six repeated runs,
the CPU/DirectML top-500 sets and complete ordering were identical, and the
maximum score delta was `1.1920928955078125e-07`. Warm DirectML inference took
0.00275206 seconds versus 0.00801490 seconds on ORT CPU, a measured 2.91x
speedup for 65,536 candidates. The first DirectML run took about 1.64 seconds,
so the lane is deliberately reserved for large or persistent batches.

The first real surrogate run ranked 960 pre-compile mutation candidates. Its
complete ordering and top-500 set matched both PyTorch and ORT CPU; maximum
score deltas were 1.91e-6 for PyTorch→ORT CPU and 2.86e-6 for ORT CPU→DirectML.
Warm DirectML inference was 1.47x faster than ORT CPU. This proves the Iris Xe
path executes the project's ranker, but it does not override the model's own
compile-savings gate: a statistically weak model still falls back to the cheap
CPU heuristic regardless of inference speed.

## Promotion rules

Routing is disabled when any of these conditions fails:

1. `DmlExecutionProvider` is unavailable or is not selected first.
2. strict no-CPU-fallback session creation fails, which catches unsupported
   ONNX operators instead of silently running them on the CPU;
3. model, input, request, response, or output hashes disagree;
4. tensor contract, finite-value, uniqueness, or permutation checks fail;
5. repeated output is not bitwise deterministic;
6. CPU and DirectML top-k sets differ, or reordered scores differ beyond the
   configured epsilon;
7. warm end-to-end inference does not beat the CPU baseline by at least 10%.

Every failure must fall back to CPU ranking with a recorded reason. Changing
the GPU driver, DirectML DLL, ONNX model, ORT version, Python runtime, or model
opset requires rerunning the gate.

## Future backend

The Windows installation also exposes `ze_loader.dll` and a Level Zero SDK,
but no SPIR-V producer or oneAPI compiler is installed. Level Zero is therefore
probe-only; hand-authoring SPIR-V would be fragile and would not improve the
decompilation evidence chain. OpenVINO is the preferred future Intel-specific
backend if it beats DirectML under the same contract.
