#include "types.h"

extern u8 D_80074924[];
extern u8 D_80074934[];
extern u32 *D_8007A9A0;
extern u32 *D_8007A9C0[];
extern void func_80045704(u32 value, u32 resource);

void display_command_link(u8 *context, u32 value, u32 index)
{
    u32 selected;
    u32 *command;
    u32 **slot;
    u32 resource;
    u32 row;
    u32 offset;
    u32 slot_offset;
    u32 *previous;

    if (context[0x50] == 0) {
        selected = D_80074924[(u8)index];
    } else {
        selected = D_80074934[(u8)index];
    }

    command = D_8007A9A0;
    command[1] = value;
    command[0] = (*(u32 **)(context + 0x24))[(u8)index];
    command[2] = *(u32 *)(context + 0x28);
    D_8007A9A0 = command + 4;

    row = context[0x51];
    value = (u32)D_8007A9C0;
    offset = row << 2;
    offset += row;
    offset <<= 4;
    do { slot_offset = selected << 2; } while (0);
    offset += value;
    slot = (u32 **)(slot_offset + offset);
    previous = *slot;
    *slot = command;
    command[3] = previous;

    resource = *(u32 *)(command[0] + 0x14);
    if (resource != 0) {
        func_80045704(0, resource);
    }
}
