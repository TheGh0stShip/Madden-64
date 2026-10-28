#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000BF08();                            /* extern */
s32 func_80011308();                            /* extern */
s32 func_80011B3C();                            /* extern */
s32 func_80011B4C();                            /* extern */
s32 func_800417C0();                            /* extern */
s32 func_80041804();                            /* extern */
s32 func_800AA370();                            /* extern */
s32 func_800AAC40();                            /* extern */
s32 func_800AAC94();                            /* extern */
s32 func_800ABBE0();                            /* extern */
s32 func_800AD460();                            /* extern */
s32 func_800AD49C();                            /* extern */
s32 func_800AD54C();                            /* extern */
s32 func_800AEABC();                                /* extern */
s32 func_800B2968(u8, u16, u8);                 /* extern */
s32 func_800B7DD8(s32, s32, s32, s32, s32); /* extern */
extern u16 D_80064A72;
extern s16 D_800857C0;
extern s16 D_800857CA;

void func_8009178C(void *arg0) {
    s32 temp_s0;

    func_80011B3C();
    func_80011B4C();
    func_80011308();
    if (D_80064A72 == 0) {
        func_800B7DD8(2, 0xB, 0, 0, 0);
    }
    if (D_800857C0 != 0) {
        D_800857CA = 0;
        func_800AA370();
    }
    if (D_80064A72 != 1) {
        func_800AD49C();
        func_800AAC40();
        temp_s0 = func_800AEABC();
        func_800AD54C();
        func_80041804();
        func_800B2968((*(u8 *)((u8 *)(arg0) + 7)), (*(u16 *)((u8 *)(arg0) + 0xA)), (*(u8 *)((u8 *)(arg0) + 0xF)));
        func_800AD460();
        func_800417C0();
        func_8000BF08();
        func_8000BF08();
        if ((temp_s0 & 0xFF) == 1) {
            func_800ABBE0();
        }
        func_800AAC94();
    }
}
