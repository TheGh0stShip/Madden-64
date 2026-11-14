#!/usr/bin/env python3
"""Fused CUDA ranker with pinned, double-buffered candidate streaming.

Unlike the reference PyTorch ranker, one CUDA kernel computes byte, bit, word,
and length distances in a single pass.  Two pinned host buffers and two CUDA
streams overlap filesystem/CPU preparation of batch N+1 with H2D transfer and
scoring of batch N.  Exact candidates still require the independent matcher.
"""
from __future__ import annotations

import argparse
import heapq
import json
import os
from pathlib import Path

import numpy as np

KERNEL = r'''
extern "C" __global__
void score(const unsigned char *candidates, const int *lengths,
           const unsigned char *target, int target_len, int stride, int count,
           int *byte_out, int *bit_out, int *word_out, int *length_out) {
    int row = blockDim.x * blockIdx.x + threadIdx.x;
    if (row >= count) return;
    int clen = lengths[row];
    int width = clen > target_len ? clen : target_len;
    int bytes = 0, bits = 0, words = 0;
    bool word_bad = false;
    const unsigned char *candidate = candidates + ((long long)row * stride);
    for (int i = 0; i < width; ++i) {
        bool cp = i < clen, tp = i < target_len;
        unsigned char a = cp ? candidate[i] : 0;
        unsigned char b = tp ? target[i] : 0;
        bool bad = (cp != tp) || (a != b);
        bytes += bad;
        bits += cp && tp ? __popc((unsigned int)(a ^ b)) : (bad ? 8 : 0);
        word_bad = word_bad || bad;
        if ((i & 3) == 3 || i + 1 == width) {
            words += word_bad;
            word_bad = false;
        }
    }
    byte_out[row] = bytes;
    bit_out[row] = bits;
    word_out[row] = words;
    length_out[row] = clen - target_len;
}
'''


def residual(target: bytes, candidate: bytes) -> dict[str, int]:
    from gpu_candidate_bytes_rank import residual_classes
    return residual_classes(target, candidate)


class Buffer:
    def __init__(self, cp, batch: int, stride: int, kernel) -> None:
        self.cp, self.batch, self.stride, self.kernel = cp, batch, stride, kernel
        self.stream = cp.cuda.Stream(non_blocking=True)
        self.host_mem = cp.cuda.alloc_pinned_memory(batch * stride)
        self.host = np.frombuffer(self.host_mem, dtype=np.uint8,
                                  count=batch * stride).reshape(batch, stride)
        self.host_lengths_mem = cp.cuda.alloc_pinned_memory(batch * 4)
        self.host_lengths = np.frombuffer(self.host_lengths_mem, dtype=np.int32,
                                          count=batch)
        self.device = cp.empty((batch, stride), dtype=cp.uint8)
        self.lengths = cp.empty(batch, dtype=cp.int32)
        self.outputs = [cp.empty(batch, dtype=cp.int32) for _ in range(4)]
        self.pending: tuple[list[dict], list[bytes], int] | None = None

    def launch(self, rows: list[dict], blobs: list[bytes], target_gpu, target_len: int) -> None:
        count = len(rows)
        self.host[:count].fill(0)
        for index, blob in enumerate(blobs):
            self.host[index, :len(blob)] = np.frombuffer(blob, dtype=np.uint8)
            self.host_lengths[index] = len(blob)
        with self.stream:
            self.device[:count].set(self.host[:count], stream=self.stream)
            self.lengths[:count].set(self.host_lengths[:count], stream=self.stream)
            blocks = (count + 255) // 256
            self.kernel((blocks,), (256,),
                        (self.device, self.lengths, target_gpu, np.int32(target_len),
                         np.int32(self.stride), np.int32(count), *self.outputs),
                        stream=self.stream)
        self.pending = (rows, blobs, count)

    def collect(self) -> list[tuple[int, int, int, int, dict, bytes]]:
        if self.pending is None:
            return []
        self.stream.synchronize()
        rows, blobs, count = self.pending
        values = [output[:count].get() for output in self.outputs]
        self.pending = None
        return [(int(values[0][i]), int(values[1][i]), int(values[2][i]),
                 abs(int(values[3][i])), rows[i], blobs[i]) for i in range(count)]


def rank(target: bytes, rows: list[dict], batch: int, limit: int,
         memory_fraction: float = .70, max_pinned_gib: float = .75) -> tuple[list, dict]:
    try:
        import cupy as cp
    except ImportError as exc:
        raise SystemExit("CuPy is required; run with the configured GPU environment") from exc
    if cp.cuda.runtime.getDeviceCount() < 1:
        raise SystemExit("CUDA device unavailable")
    if not rows:
        free_memory, total_memory = cp.cuda.runtime.memGetInfo()
        device = cp.cuda.runtime.getDeviceProperties(0)["name"].decode()
        return [], {"device": device, "kernel": "fused-cupy-rawkernel",
                    "pinned_buffers": 0, "streams": 0, "candidates": 0,
                    "retained": 0, "stride": 0, "batch": 0,
                    "gpu_total_bytes": total_memory, "gpu_free_bytes_at_start": free_memory,
                    "gpu_buffer_bytes": 0, "pinned_buffer_bytes": 0,
                    "gpu_memory_fraction": memory_fraction}
    max_length = max([len(target), *(Path(row["path"]).stat().st_size for row in rows)])
    stride = (max_length + 3) & ~3
    free_memory, total_memory = cp.cuda.runtime.memGetInfo()
    if batch <= 0:
        # Two device buffers each hold text, lengths, and four score vectors.
        per_candidate_device = stride + 5 * 4
        device_budget = max(1, int(free_memory * memory_fraction) - (512 << 20))
        device_limit = max(1, device_budget // (2 * per_candidate_device))
        # Page-locked RAM is a distinct scarce resource on this 16 GiB host.
        pinned_budget = max(1, int(max_pinned_gib * (1 << 30)))
        pinned_limit = max(1, pinned_budget // (2 * max(1, stride + 4)))
        batch = min(len(rows), device_limit, pinned_limit)
    kernel = cp.RawKernel(KERNEL, "score")
    target_gpu = cp.asarray(np.frombuffer(target, dtype=np.uint8))
    buffers = [Buffer(cp, batch, stride, kernel), Buffer(cp, batch, stride, kernel)]
    heap: list[tuple[tuple[int, int, int, int], int, dict, bytes]] = []
    serial = 0
    for number, start in enumerate(range(0, len(rows), batch)):
        slot = buffers[number & 1]
        for bd, bits, wd, ld, row, blob in slot.collect():
            key = (bd, bits, wd, ld)
            item = (-key[0], -key[1], -key[2], -key[3])
            heapq.heappush(heap, (item, serial, row, blob)); serial += 1
            if len(heap) > limit:
                heapq.heappop(heap)
        chunk = rows[start:start + batch]
        blobs = [Path(row["path"]).read_bytes() for row in chunk]
        slot.launch(chunk, blobs, target_gpu, len(target))
    for slot in buffers:
        for bd, bits, wd, ld, row, blob in slot.collect():
            item = (-bd, -bits, -wd, -ld)
            heapq.heappush(heap, (item, serial, row, blob)); serial += 1
            if len(heap) > limit:
                heapq.heappop(heap)
    ranked = []
    for negative, _, row, blob in heap:
        bd, bits, wd, ld = (-negative[0], -negative[1], -negative[2], -negative[3])
        result = dict(row)
        result.update(exact=bd == 0 and ld == 0, byte_diff=bd, bit_diff=bits,
                      word_diff=wd, length_diff=ld, residual=residual(target, blob))
        ranked.append(result)
    ranked.sort(key=lambda r: (r["byte_diff"], r["bit_diff"], r["word_diff"],
                               r["length_diff"], str(r.get("path", ""))))
    device = cp.cuda.runtime.getDeviceProperties(0)["name"].decode()
    return ranked, {"device": device, "kernel": "fused-cupy-rawkernel",
                    "pinned_buffers": 2, "streams": 2, "candidates": len(rows),
                    "retained": len(ranked), "stride": stride, "batch": batch,
                    "gpu_total_bytes": total_memory, "gpu_free_bytes_at_start": free_memory,
                    "gpu_buffer_bytes": 2 * batch * (stride + 5 * 4),
                    "pinned_buffer_bytes": 2 * batch * (stride + 4),
                    "gpu_memory_fraction": memory_fraction}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("target", type=Path)
    ap.add_argument("candidates", type=Path)
    ap.add_argument("output", type=Path)
    ap.add_argument("--batch", type=int, default=0,
                    help="candidates per buffer; 0 sizes from live free VRAM")
    ap.add_argument("--limit", type=int, default=1024)
    ap.add_argument("--gpu-memory-fraction", type=float,
                    default=min(.70, float(os.environ.get("DECOMP_GPU_FRACTION", ".70"))))
    ap.add_argument("--max-pinned-gib", type=float, default=.75)
    args = ap.parse_args()
    rows = [json.loads(line) for line in args.candidates.read_text().splitlines() if line.strip()]
    if (not 0.1 <= args.gpu_memory_fraction <= .9 or args.max_pinned_gib <= 0
            or args.limit <= 0 or args.batch < 0):
        raise SystemExit("unsafe memory budget")
    ranked, report = rank(args.target.read_bytes(), rows, args.batch, args.limit,
                          args.gpu_memory_fraction, args.max_pinned_gib)
    args.output.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in ranked))
    print(json.dumps(report, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
