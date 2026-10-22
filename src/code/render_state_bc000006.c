#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088AA4[];

void func_8000B184(u32 index, u32 value) {
    u32* states = D_80088AA4;
    u32 offset = index * 4;
    u32* state = (u32*)((u8*)states + offset);
    if (*state != value) {
        u32* command = D_80084F5C;
        D_80084F5C = command + 2;
        command[0] = 0xBC000006 | ((offset & 0xFFFF) << 8);
        command[1] = value;
        *state = value;
    }
}
