#include "types.h"

extern u8 D_800724DA;
extern u8 D_800724DB;
extern u8 *D_800724DC;
extern void *func_80032E00(s32 zero, u32 size);

void resource_entries_initialize(u8 *entries)
{
    u32 count;
    u8 *entry;
    u32 marker;
    u32 state;
    u8 *original = entries;

    count = 0;
    if (*(u16 *)original != 0) {
        state = 2;
        marker = 0xFF;
        entry = original;
loop:
        *(void **)(entry + 4) = func_80032E00(0, *(u16 *)entry);
        *(u32 *)(entry + 8) = state;
        entry[0x0C] = 0;
        entry[0x0D] = marker;
        *(u32 *)(entry + 0x10) = 0;
        entry += 0x14;
        count++;
        if (*(u16 *)entry != 0) {
            goto loop;
        }
    }
    D_800724DC = original;
    D_800724DA = count;
    D_800724DB = 1;
}
