#include "types.h"

extern s16 D_800886E0;
extern u8 D_80085040[];
extern s8 D_800876B8;

void func_800D7AC8(u32 slot)
{
    s32 count = 0;
    s32 active_type = 30;
    s32 enabled;
    u8 *groups;
    s32 group;
    u8 *object;

    do {
        group = D_800886E0;
    } while (0);
    enabled = 1;
    groups = D_80085040;
    object = *((u8 **)(groups + group * 88) + slot);
    while (count < 10) {
        u32 type = object[count * 4 + 0x64];

        if (type == 0) {
            break;
        }
        if (type == active_type) {
            if (D_800876B8 == enabled) {
                object[count * 4 + 0x65] = 0;
            } else {
                object[count * 4 + 0x65] = enabled;
            }
        }
        count++;
    }
}
