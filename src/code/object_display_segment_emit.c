#include "types.h"

extern u32 *volatile D_80084F5C;
extern u16 D_8008AFD4;

void object_display_segment_emit(u8 *object)
{
    register u8 *saved_object __asm__("$8") = object;
    register u32 command0 __asm__("$6");
    register u32 object_address __asm__("$5");
    register u32 command1 __asm__("$7");
    register u32 *commands __asm__("$4");
    register u32 address __asm__("$2");
    register u32 *next __asm__("$3");

    if (*(u16 *)(saved_object + 0x1EA) == 0) {
        return;
    }
    command0 = 0x01030040;
    object_address = 0x80000068;
    command1 = 0x01020000;
    __asm__("" : "=r"(command1) : "0"(command1));
    commands = D_80084F5C;
    address = D_8008AFD4;
    __asm__("" : "=r"(commands), "=r"(address)
            : "0"(commands), "1"(address));
    command1 |= 0x40;
    object_address += (u32)saved_object;
    next = commands + 2;
    D_80084F5C = next;
    next = commands + 4;
    address <<= 6;
    address += 0xE8;
    address = (u32)saved_object + address;
    D_80084F5C = next;
    next = (u32 *)0x80000000;
    address -= (u32)next;
    commands[0] = command0;
    commands[1] = object_address;
    commands[2] = command1;
    commands[3] = address;
    *(u16 *)(saved_object + 0x1EA) = 0;
}
