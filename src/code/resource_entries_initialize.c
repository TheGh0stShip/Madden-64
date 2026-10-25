#include "types.h"

extern u8 D_800724DA;
extern u8 D_800724DB;
extern u8 *D_800724DC;
extern void *func_80032E00(s32 zero, u32 size);

void resource_entries_initialize(u8 *entries)
{
    register u8 *original __asm__("$18") = entries;
    register u32 count __asm__("$17");

    __asm__ volatile ("" : : "r" (original));
    count = 0;
    if (*(u16 *)original != 0) {
        register u32 state __asm__("$20") = 2;
        register u32 marker __asm__("$19") = 0xFF;
        register u8 *entry __asm__("$16") = original;

        count = 0;
        do {
            *(void **)(entry + 4) = func_80032E00(0, *(u16 *)entry);
            *(u32 *)(entry + 8) = state;
            entry[0x0C] = 0;
            entry[0x0D] = marker;
            *(u32 *)(entry + 0x10) = 0;
            entry += 0x14;
            count++;
        } while (*(u16 *)entry != 0);
    }
    D_800724DC = original;
    D_800724DA = count;
    D_800724DB = 1;
}
