#include "types.h"

s32 func_8002E99C(s32 value) {
    register f64 scale __asm__("$f0");
    register f64 result __asm__("$f0");
    register f32 root __asm__("$f2");

    if (value <= 0) {
        return 0;
    }
    __asm__ volatile(
        "lui $at, 0x8000\n"
        "lwc1 $f1, 0x1590($at)\n"
        "lwc1 $f0, 0x1594($at)"
        : "=f"(scale));
    root = (f32)((f64)value * scale);
    __asm__ volatile("sqrt.s %0, %1" : "=f"(root) : "f"(root));
    __asm__ volatile(
        "lui $at, 0x8000\n"
        "lwc1 $f1, 0x1598($at)\n"
        "lwc1 $f0, 0x159C($at)"
        : "=f"(scale));
    result = (f64)root * scale;
    return (s32)result;
}
