#include "types.h"

extern u32 *D_8007AB24;
extern u16 display_vertex_batch_append(void *vertices);

void display_strip_emit(void *vertices, u16 *indices)
{
    register u32 base __asm__("$7") = display_vertex_batch_append(vertices);
    register u32 count __asm__("$8") = 0;
    register u32 command_word __asm__("$9") = 0xB1000000;
    register u16 *cursor __asm__("$6") = indices + 3;

    __asm__("" : "=r"(count) : "0"(count));
    do {
        u32 *command = D_8007AB24;
        register u32 *next __asm__("$2");
        register u32 temp_a0 __asm__("$4");
        register u32 temp_v0 __asm__("$2");
        register u32 temp_v1 __asm__("$3");

        next = command + 2;
        D_8007AB24 = next;
        temp_a0 = cursor[-2];
        count++;
        temp_v1 = indices[0];
        temp_a0 += base;
        temp_a0 <<= 9;
        temp_v0 = cursor[-1];
        temp_a0 &= 0xFE00;
        temp_v1 += base;
        temp_v1 <<= 1;
        __asm__("" : "=r"(temp_v1) : "0"(temp_v1));
        temp_v1 &= 0xFF;
        temp_v1 <<= 16;
        temp_v1 |= temp_a0;
        temp_v0 += base;
        temp_v0 <<= 1;
        __asm__("" : "=r"(temp_v0) : "0"(temp_v0));
        temp_v0 &= 0xFF;
        temp_v1 |= temp_v0;
        temp_v1 |= command_word;
        command[0] = temp_v1;

        temp_v0 = indices[0];
        temp_v1 = cursor[-1];
        temp_a0 = cursor[0];
        cursor++;
        temp_v0 += base;
        temp_v0 <<= 1;
        __asm__("" : "=r"(temp_v0) : "0"(temp_v0));
        temp_v0 &= 0xFF;
        temp_v0 <<= 16;
        temp_v1 += base;
        temp_v1 <<= 9;
        temp_v1 &= 0xFE00;
        temp_v0 |= temp_v1;
        temp_a0 += base;
        temp_a0 <<= 1;
        __asm__("" : "=r"(temp_a0) : "0"(temp_a0));
        temp_a0 &= 0xFF;
        temp_v0 |= temp_a0;
        command[1] = temp_v0;
        indices++;
    } while ((u16)count < 6);
}
