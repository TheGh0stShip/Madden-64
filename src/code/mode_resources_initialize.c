#include "types.h"

extern u8 D_80001190[];
extern s16 D_80088118[];
extern void *D_800895B8;
extern s16 *D_800885E4;
extern s16 D_8006BA22;
extern void *func_800E2124(void *resource, s32 zero);

void mode_resources_initialize(void)
{
    s16 *base;
    s16 *scan;
    s16 index;
    s16 next;
    s32 missing;
    s32 present;
    void *resource;

    resource = func_800E2124(D_80001190, 0);
    do {
        index = 0;
        base = D_80088118;
    } while (0);
    missing = -1;
    present = 1;
    D_800895B8 = resource;
    D_800885E4 = base;
    D_8006BA22 = 0;
    scan = base;
    do {
        if (scan[index + 0x44] != missing) {
            D_8006BA22 = present;
        }
        next = index + 1;
        index = next;
    } while (next < 8);
}
