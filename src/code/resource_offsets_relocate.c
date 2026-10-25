#include "types.h"

u8 *resource_offsets_relocate(u8 *resource)
{
    register u8 *base __asm__("$6") = resource;
    register u8 *first __asm__("$2");
    register u8 *third __asm__("$3");
    register u8 *fourth __asm__("$4");
    register u8 *fifth __asm__("$5");
    register u8 *header __asm__("$7");
    register u32 index __asm__("$4");
    register u8 *record __asm__("$3");
    u32 count;

    first = *(u8 **)(base + 0xC);
    third = *(u8 **)(base + 0x14);
    fourth = *(u8 **)(base + 0x18);
    fifth = *(u8 **)(base + 0x1C);
    first += (u32)base;
    *(u8 *volatile *)(base + 0xC) = first;
    first = *(u8 **)(base + 0x10);
    header = *(u8 *volatile *)(base + 0xC);
    __asm__("" : "=r"(header), "=r"(third)
            : "0"(header), "1"(third));
    third += (u32)base;
    fourth += (u32)base;
    fifth += (u32)base;
    *(u8 **)(base + 0x14) = third;
    *(u8 **)(base + 0x18) = fourth;
    *(u8 **)(base + 0x1C) = fifth;
    first += (u32)base;
    *(u8 **)(base + 0x10) = first;
    count = *(u32 *)header;
    {
        volatile u64 unused;

        index = 0;
        if (count != 0) {
            record = header + 8;
            do {
                *(u8 **)record = *(u8 **)record + (u32)base;
                index++;
                record += 8;
            } while (index < **(u32 **)(base + 0xC));
        }
    }
    return base;
}
