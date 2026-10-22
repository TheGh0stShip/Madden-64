#include "types.h"

extern s16 D_800886E0;
extern u8 D_80085040[];
extern u8 D_800876B8;

void func_800D79B8(void) {
    register s32 outer asm("$5");
    register u8* groups asm("$7");
    register s32 active_type asm("$6");
    register s32 group asm("$2");
    register s32 inner asm("$4");
    register u8* object asm("$3");

    D_800876B8 = 1;
    outer = 0;
    groups = D_80085040;
    active_type = 30;
    do {
        group = D_800886E0;
        inner = 0;
        object = (u8*)(group * 88 + (u32)groups);
        __asm__ volatile("" : "=r"(object) : "0"(object));
        object = *((u8**)object + outer);

        while (inner < 10) {
            u32 type = object[0x64];

            if (type == 0) {
                break;
            }
            if (type == active_type) {
                object[0x65] = 0;
            }
            inner++;
            object += 4;
        }
        outer++;
    } while (outer < 11);
}
