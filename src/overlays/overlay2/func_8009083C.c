#include "types.h"

#ifndef NULL
#define NULL 0
#endif

void *func_8008DC10(s8, s16);                       /* extern */
extern s8 D_800C509C;

void func_8009083C(void) {
    s16 temp_v1;
    s16 var_s0;
    u8 temp_a0;
    void *temp_v0;

    var_s0 = 0;
    do {
        temp_v0 = func_8008DC10(D_800C509C, var_s0);
        temp_a0 = (*(u8 *)((u8 *)(temp_v0) + 4));
        temp_v1 = var_s0 + 1;
        var_s0 = temp_v1;
        (*(u8 *)((u8 *)(temp_v0) + 0)) = 0xFF;
        (*(u8 *)((u8 *)(temp_v0) + 1)) = 0xFF;
        (*(u8 *)((u8 *)(temp_v0) + 2)) = 0;
        (*(u8 *)((u8 *)(temp_v0) + 3)) = 0;
        (*(u8 *)((u8 *)(temp_v0) + 5)) = 0;
        (*(u8 *)((u8 *)(temp_v0) + 4)) = (s8) (temp_a0 & 0xF);
    } while (temp_v1 < 0xF);
}
