#include "types.h"

void func_80008F30(s32 destination, const void* source, s32 value, s32 id);
extern u8 D_80097968[];

void func_8009C05C(s32 value, s32 destination) {
    func_80008F30(destination, D_80097968, value, 0x91);
}
