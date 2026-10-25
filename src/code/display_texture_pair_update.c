#include "types.h"

extern u32 *D_80084F5C;
extern u32 D_80088A7C[];

void display_texture_pair_update(s32 index, u32 value)
{
    s32 slot = index - 1;
    u32 *cache_base = D_80088A7C;
    u32 *cached = &cache_base[index];
    s32 first = slot << 5;
    s32 second = first + 4;

    if (*cached != value) {
        u32 *command = D_80084F5C;
        u32 opcode = 0xBC00000A;

        D_80084F5C = command + 2;
        command[0] = opcode | ((first & 0xFFFF) << 8);
        command[1] = value;
        D_80084F5C = command + 4;
        command[2] = opcode | ((second & 0xFFFF) << 8);
        command[3] = value;
        *cached = value;
    }
}
