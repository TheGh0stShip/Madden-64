#include "types.h"

extern u8 D_80074924[];
extern u8 D_80074934[];
extern u32 *D_8007A9A0;
extern u32 *D_8007A9C0[];
extern void func_80045704(u32 value, u32 resource);

void display_command_link(u8 *context, u32 value, u32 index)
{
    register u32 selected __asm__("$8");
    u32 *command;
    register u32 **slot __asm__("$3");
    u32 resource;
    register u32 row __asm__("$3");
    register u32 offset __asm__("$2");
    register u32 slot_offset __asm__("$3");
    register u8 *slot_base __asm__("$5");
    register u32 *previous __asm__("$5");

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
    slot_base = (u8 *)D_8007A9C0;
    offset = row << 2;
    offset += row;
    offset <<= 4;
    slot_offset = selected << 2;
    offset += (u32)slot_base;
    slot = (u32 **)(slot_offset + offset);
    __asm__("" : "=r"(slot) : "0"(slot));
    previous = *slot;
    *slot = command;
    command[3] = previous;

    resource = *(u32 *)(command[0] + 0x14);
    if (resource != 0) {
        func_80045704(0, resource);
    }
}
