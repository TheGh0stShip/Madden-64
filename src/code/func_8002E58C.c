#include "types.h"

void *func_8002E58C(void *destination, u32 value, u32 size)
{
    register u8 *cursor __asm__("$7");
    register u32 byte __asm__("$8");
    register u32 word __asm__("$3");
    u32 initial = (((u32)destination & 3) != 0) && (size != 0);

    cursor = destination;
    if (initial) {
        __asm__("" : "=r"(cursor) : "0"(cursor));
        byte = value;
        *cursor = byte;
        cursor++;
        size--;
        while ((((u32)cursor & 3) != 0) && (size != 0)) {
            *cursor = byte;
            cursor++;
            size--;
        }
    }
    if (size >= 5) {
        word = value & 0xFF;
        word |= word << 8;
        word |= word << 16;
        do {
            *(u32 *)cursor = word;
            size -= 4;
            cursor += 4;
        } while (size >= 5);
    }
    size--;
    if (size != (u32)-1) {
        do {
            *cursor = value;
            size--;
            cursor++;
        } while (size != (u32)-1);
    }
    return destination;
}
