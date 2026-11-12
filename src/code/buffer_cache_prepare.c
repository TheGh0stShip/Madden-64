#include "types.h"

extern void* D_8008617C;
extern void func_8004F158();
extern void func_800329B8();
extern void func_80046CF8();

s32 func_800365B8(void* unused, void* buffer, s32 size) {
    size += 3;
    size &= ~3;
    func_8004F158(buffer, size);
    func_800329B8(buffer, D_8008617C, size);
    func_80046CF8(buffer, size);
    return size;
}
