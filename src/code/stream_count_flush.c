#include "types.h"

extern void func_80033B20(void*, u16);

void func_800346B4(u8* state) {
    u8* stream = *(u8**)(state + 8);
    u16 count = *(u16*)(stream + 0x10);

    *(u16*)(stream + 0x10) = 0;
    func_80033B20(state, count);
}
