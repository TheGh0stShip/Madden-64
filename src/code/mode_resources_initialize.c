#include "types.h"

extern u8 D_80001190[];
extern s16 D_80088118[];
extern void *D_800895B8;
extern s16 *D_800885E4;
extern s16 D_8006BA22;
extern void *func_800E2124(void *resource, s32 zero);

void mode_resources_initialize(void)
{
    register s32 index __asm__("$4");
    register s16 *base __asm__("$3");
    register s32 missing __asm__("$6");
    register s32 present __asm__("$5");
    register s32 next __asm__("$2");
    void *resource;

    resource = func_800E2124(D_80001190, 0);
    index = 0;
    base = D_80088118;
    __asm__ volatile ("" : "=r" (base) : "0" (base));
    missing = -1;
    present = 1;
    D_800895B8 = resource;
    D_800885E4 = base;
    D_8006BA22 = 0;
    do {
        if (*(s16 *)((u8 *)base + (s16)index * 2 + 0x88) != missing) {
            D_8006BA22 = present;
        }
        next = index + 1;
        index = next;
        __asm__ volatile ("" : "=r" (next) : "0" (next));
    } while ((s16)next < 8);
}
