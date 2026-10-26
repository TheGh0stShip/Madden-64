#include "types.h"

typedef struct ResourcePoolEntry {
    u16 value;
    u8 field2;
    u8 field3;
    u8 active;
    u8 pad5;
} ResourcePoolEntry;

extern s32 D_80072320;
extern u8 D_80089368[];
extern ResourcePoolEntry D_8008B3B0[];
extern s32 func_8004CDA8(void *resource, s32 index, s32 mode);
extern void func_8004F31C(ResourcePoolEntry *entries);

void resource_pool_reset_wait(void)
{
    register ResourcePoolEntry *entries __asm__("$16") = D_8008B3B0;
    register s32 counter __asm__("$5");
    register u8 *entry __asm__("$4");
    register s32 offset __asm__("$3");
    register s32 previous __asm__("$6");

    for (;;) {
        D_80072320 = 0;
        func_8004CDA8(D_80089368, 0, 1);
        while (func_8004CDA8(D_80089368, 0, 0) == 0) {
        }
        func_8004F31C(D_8008B3B0);
        counter = 3;
        entry = (u8 *)entries + 18;
        offset = 18;
        do {
            previous = counter;
            if (*(u8 *)((u32)&D_8008B3B0 + offset + 4) != 0) {
                entry[3] = 0;
                *(u8 *)((u32)&D_8008B3B0 + offset + 2) = 0;
                *(u16 *)((u32)&D_8008B3B0 + offset) = 0;
            }
            entry -= 6;
            offset -= 6;
            counter--;
        } while (previous != 0);
    }
}
