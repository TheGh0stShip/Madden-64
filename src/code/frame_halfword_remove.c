#include "types.h"

extern u8 *D_80073438;
extern void func_8002E17C(void *destination, const void *source, u32 size);

void frame_halfword_remove(u32 value)
{
    register u32 index __asm__("$5") = 0;
    register u32 target __asm__("$8") = (u16)value;
    register u32 remaining __asm__("$6") = 127;
    register u32 invalid __asm__("$16") = 0xFFFF;

    do {
        register u8 *table __asm__("$7") = D_80073438;
        register u32 narrowed __asm__("$3") = (u16)index;
        register u32 offset __asm__("$4") = narrowed << 1;
        __asm__ volatile("" : "=r"(table) : "0"(table));
        __asm__("" : "=r"(offset) : "0"(offset));

        if (*(u16 *)(table + 0xCE4 + offset) == target) {
            register u32 source_offset __asm__("$5");

            __asm__ volatile("" ::: "memory");
            __asm__ volatile("" : "=r"(narrowed) : "0"(narrowed));
            offset += 0xCE4;
            source_offset = narrowed << 1;
            source_offset += 0xCE6;
            remaining -= narrowed;
            func_8002E17C(table + offset, table + source_offset,
                          remaining << 1);
            *(u16 *)(D_80073438 + 0xDE2) = invalid;
            return;
        }
        index++;
    } while ((u16)index < 128);
}
