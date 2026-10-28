#include "types.h"

#ifndef NULL
#define NULL 0
#endif

u8 func_80031A1C(s32);
void func_800B7B0C(s32, s32, u8);
extern void *D_80088090;

void func_800C5954(void *arg0) {
    s32 var_s0;
    s32 var_s1;
    s16 delay;
    void *temp_v0;
    void *temp_v0_2;

    if ((*(u16 *)((u8 *)(D_80088090) + 0x206)) & 0x100) {
        temp_v0 = (*(void **)((u8 *)(arg0) + 0x24));
        var_s1 = -(*(s32 *)((u8 *)(temp_v0) + 0x1C));
        var_s0 = -(*(s32 *)((u8 *)(temp_v0) + 0x20));
    } else {
        temp_v0_2 = (*(void **)((u8 *)(arg0) + 0x24));
        var_s1 = (*(s32 *)((u8 *)(temp_v0_2) + 0x1C));
        var_s0 = (*(s32 *)((u8 *)(temp_v0_2) + 0x20));
    }
    delay = func_80031A1C(0xA) + 0xC;
    func_800B7B0C(var_s1, var_s0, delay);
}
