#include "types.h"

extern void* D_8008617C;
extern void func_8004F158();
extern void func_800329B8();
extern void func_80046CF8();

s32 func_800365B8(void* unused, void* buffer, s32 size) {
    register void* target __asm__("$16");
    register void* call_target __asm__("$4");
    s32 aligned_size;

    target = buffer;
    aligned_size = (size + 3) & ~3;
    __asm__("addu %0,%1,$0" : "=r"(call_target) : "r"(target), "r"(aligned_size));
    func_8004F158(call_target, aligned_size);
    func_800329B8(target, D_8008617C, aligned_size);
    func_80046CF8(target, aligned_size);
    return aligned_size;
}
