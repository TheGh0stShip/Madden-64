#include "types.h"

extern u32* D_80084F5C;
extern s32 D_80088A64;
extern s32 D_80088A68;

void func_8000AECC(s32 start, s32 end) {
    s32* state = &D_80088A64;

    if (state[0] != start || state[1] != end) {
        s32 distance = end - start;
        s32 scale = 0x1F400 / distance;
        s32 offset = ((500 - start) << 8) / distance;
        u32* command = D_80084F5C;

        D_80084F5C = command + 2;
        command[0] = 0xBC000008;
        command[1] = (scale << 16) | (offset & 0xFFFF);
        state[0] = start;
        state[1] = end;
    }
}
