#include "types.h"

extern s16 D_800886E0;
extern u8 D_80085040[];
extern u8 D_800876B8;

void func_800D7A40(void)
{
    s32 outer;
    u8 *groups;
    s32 active_type;
    s32 enabled;
    s32 group;
    s32 inner;
    u8 *object;

    D_800876B8 = 0;
    outer = 0;
    groups = D_80085040;
    active_type = 30;
    enabled = 1;
    do {
        group = D_800886E0;
        inner = 0;
        object = (u8 *)(group * 88 + (u32)groups);
        object = *((u8 **)object + outer);
        while (inner < 10) {
            u32 type = object[inner * 4 + 0x64];

            if (type == 0) {
                break;
            }
            if (type == active_type) {
                object[inner * 4 + 0x65] = enabled;
            }
            inner++;
        }
        outer++;
    } while (outer < 11);
}
