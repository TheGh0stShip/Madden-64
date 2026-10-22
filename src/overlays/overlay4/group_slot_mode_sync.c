#include "types.h"

extern s16 D_800886E0;
extern u8 D_80085040[];
extern s8 D_800876B8;

void func_800D7AC8(u32 slot) {
    register s32 count asm("$6") = 0;
    register s32 active_type asm("$8") = 30;
    register s32 enabled asm("$7");
    register u8* groups asm("$5") = D_80085040;
    register s32 group asm("$3") = D_800886E0;
    register u8* object asm("$4") =
        *((u8**)(groups + group * 88) + slot);

    enabled = 1;

    while (count < 10) {
        u32 type = object[0x64];

        if (type == 0) {
            break;
        }
        if (type == active_type) {
            if (D_800876B8 == enabled) {
                object[0x65] = 0;
            } else {
                object[0x65] = enabled;
            }
        }
        count++;
        object += 4;
    }
}
