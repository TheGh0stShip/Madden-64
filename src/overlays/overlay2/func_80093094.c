#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80024694();                            /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_80024EDC(s32);                     /* extern */
s32 func_80024F5C();                            /* extern */
s32 func_8003A7DC(s32, void *);          /* extern */
s32 func_8003AE80(void *, void *);           /* extern */
s32 func_8003EB2C();                            /* extern */
s32 func_8003EB78();                            /* extern */
s32 func_80093D60(void *, s32, s32, s32, s32, s32, s32 *); /* extern */
extern u8 D_80080C90[];
extern u8 D_80080CFC[];
extern s16 D_80082D94;
extern s16 D_80082D96;
extern s16 D_80082DB0;
extern s16 D_80084EE0;
extern s16 D_80084EE2;
extern s16 D_80084EFC;
extern u8 D_800E610C[];
extern u8 D_800E6220[];
extern u8 D_800E632C[];
extern u8 D_800E6438[];
extern u8 D_800E6658[];
extern u8 D_800E6764[];
extern u8 D_800E6870[];
extern u8 D_800E697C[];

void func_80093094(void) {
    s32 sp24;
    s32 sp20;
    u8 *temp_s1;
    u8 *temp_s1_2;
    u8 *temp_s1_3;
    u8 *temp_s2;
    u8 *temp_s2_2;
    u8 *temp_s2_3;
    u8 *temp_s7;
    u16 *var_s0;
    u16 *var_v1;
    s32 var_a0;

    sp20 = 0;
    sp24 = 0;
    func_80024EDC(1);
    func_8003EB2C();
    func_80024694();
    func_8003A7DC(0x75, D_80080C90);
    D_80082D96 = 3;
    D_80082D94 = 0;
    D_80082DB0 = 0;
    func_8003A7DC(0x74, D_80080C90 + 0x214C);
    D_80084EE2 = 3;
    D_80084EE0 = 0;
    D_80084EFC = 0;
    for (var_a0 = 0; var_a0 < 55; var_a0++) {
        ((u16 *)(D_80080C90 + 0x6C))[var_a0] = 0xFFFF;
        ((u16 *)(D_80080C90 + 0x21B8))[var_a0] = 0xFFFF;
    }
    func_80093D60(D_800E610C, 0, 0, 0, 0x1000, 1, &sp20);
    func_80093D60(D_800E610C, 0, 1, 0, 0x100, 1, &sp24);
    temp_s2 = D_800E610C + 0x20;
    func_80093D60(temp_s2, 0, 0, 0, 0x1000, 1, &sp20);
    func_80093D60(temp_s2, 0, 1, 0, 0x100, 1, &sp24);
    temp_s1 = D_800E610C + 0x30;
    func_80093D60(temp_s1, 0, 0, 0, 0x1000, 1, &sp20);
    func_80093D60(temp_s1, 0, 1, 0, 0x100, 1, &sp24);
    func_80093D60(D_800E6220, 0, 0, 1, 0x1000, 1, &sp20);
    func_80093D60(D_800E6220, 0, 1, 1, 0x100, 1, &sp24);
    temp_s1_2 = D_800E6220 + 0x10;
    func_80093D60(temp_s1_2, 0, 0, 1, 0x1000, 1, &sp20);
    func_80093D60(temp_s1_2, 0, 1, 1, 0x100, 1, &sp24);
    func_80093D60(D_800E6220, 0, 0, 2, 0x1000, 1, &sp20);
    func_80093D60(D_800E6220, 0, 1, 2, 0x100, 1, &sp24);
    func_80093D60(D_800E632C, 0, 0, 2, 0x1000, 1, &sp20);
    func_80093D60(D_800E632C, 0, 1, 2, 0x100, 1, &sp24);
    temp_s7 = D_800E632C - 8;
    func_80093D60(temp_s7, 0, 0, 3, 0x1000, 2, &sp20);
    func_80093D60(temp_s7, 0, 1, 3, 0x100, 2, &sp24);
    func_80093D60(D_800E632C, 0, 0, 3, 0x1000, 1, &sp20);
    func_80093D60(D_800E632C, 0, 1, 3, 0x100, 1, &sp24);
    temp_s2_2 = D_800E632C + 0x10;
    func_80093D60(temp_s2_2, 0, 0, 3, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_2, 0, 1, 3, 0x100, 1, &sp24);
    func_80093D60(D_800E6870, 0, 0, 3, 0x1000, 1, &sp20);
    func_80093D60(D_800E6870, 0, 1, 3, 0x100, 1, &sp24);
    func_80093D60(D_800E697C, 0, 0, 3, 0x1000, 1, &sp20);
    func_80093D60(D_800E697C, 0, 1, 3, 0x100, 1, &sp24);
    func_80093D60(temp_s7, 0, 0, 4, 0x1000, 1, &sp20);
    func_80093D60(temp_s7, 0, 1, 4, 0x100, 1, &sp24);
    func_80093D60(D_800E632C, 0, 0, 4, 0x1000, 1, &sp20);
    func_80093D60(D_800E632C, 0, 1, 4, 0x100, 1, &sp24);
    func_80093D60(D_800E632C, 0xF, 0, 4, 0x101000, 1, &sp20);
    func_80093D60(D_800E632C, 0xF, 1, 4, 0x100100, 1, &sp24);
    func_80093D60(D_800E632C, 0xF, 0, 7, 0x101000, 1, &sp20);
    func_80093D60(D_800E632C, 0xF, 1, 7, 0x100100, 1, &sp24);
    func_80093D60(D_800E632C, 0xE, 0, 7, 0x101000, 1, &sp20);
    func_80093D60(D_800E632C, 0xE, 1, 7, 0x100100, 1, &sp24);
    func_80093D60(D_800E632C, 0xF, 0, 6, 0x101000, 1, &sp20);
    func_80093D60(D_800E632C, 0xF, 1, 6, 0x100100, 1, &sp24);
    func_80093D60(D_800E632C, 0xF, 0, 8, 0x101000, 2, &sp20);
    func_80093D60(D_800E632C, 0xF, 1, 8, 0x100100, 2, &sp24);
    func_80093D60(D_800E632C, 0xE, 0, 5, 0x101000, 1, &sp20);
    func_80093D60(D_800E632C, 0xE, 1, 5, 0x100100, 1, &sp24);
    func_80093D60(D_800E632C, 0xE, 0, 9, 0x101000, 2, &sp20);
    func_80093D60(D_800E632C, 0xE, 1, 9, 0x100100, 2, &sp24);
    func_80093D60(D_800E6438, 0, 0, 0xA, 0x1000, 1, &sp20);
    func_80093D60(D_800E6438, 0, 1, 0xA, 0x100, 1, &sp24);
    temp_s2_3 = D_800E6438 - 8;
    func_80093D60(temp_s2_3, 0, 0, 0xA, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0xA, 0x100, 1, &sp24);
    func_80093D60(D_800E6438, 0, 0, 0xB, 0x1000, 1, &sp20);
    func_80093D60(D_800E6438, 0, 1, 0xB, 0x100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0xB, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0xB, 0x100, 1, &sp24);
    func_80093D60(D_800E6438, 0, 0, 0xC, 0x1000, 1, &sp20);
    func_80093D60(D_800E6438, 0, 1, 0xC, 0x100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0xC, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0xC, 0x100, 1, &sp24);
    func_80093D60(temp_s2_3, 4, 0, 0xC, 0x101000, 1, &sp20);
    func_80093D60(temp_s2_3, 4, 1, 0xC, 0x100100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0xF, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0xF, 0x100, 1, &sp24);
    func_80093D60(D_800E6438, 0, 0, 0xF, 0x1000, 1, &sp20);
    func_80093D60(D_800E6438, 0, 1, 0xF, 0x100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0xE, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0xE, 0x100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0x10, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0x10, 0x100, 1, &sp24);
    func_80093D60(D_800E6438, 0, 0, 0x10, 0x1000, 1, &sp20);
    func_80093D60(D_800E6438, 0, 1, 0x10, 0x100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0xD, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0xD, 0x100, 1, &sp24);
    temp_s1_3 = D_800E6438 + 8;
    func_80093D60(temp_s1_3, 0, 0, 0x12, 0x1000, 1, &sp20);
    func_80093D60(temp_s1_3, 0, 1, 0x12, 0x100, 1, &sp24);
    func_80093D60(temp_s1_3, 4, 0, 0x12, 0x101000, 1, &sp20);
    func_80093D60(temp_s1_3, 4, 1, 0x12, 0x100100, 1, &sp24);
    func_80093D60(temp_s1_3, 0, 0, 0x11, 0x1000, 1, &sp20);
    func_80093D60(temp_s1_3, 0, 1, 0x11, 0x100, 1, &sp24);
    func_80093D60(temp_s1_3, 4, 0, 0x11, 0x101000, 1, &sp20);
    func_80093D60(temp_s1_3, 4, 1, 0x11, 0x100100, 1, &sp24);
    func_80093D60(temp_s1_3, 0, 0, 0x13, 0x1000, 1, &sp20);
    func_80093D60(temp_s1_3, 0, 1, 0x13, 0x100, 1, &sp24);
    func_80093D60(temp_s1_3, 4, 0, 0x13, 0x101000, 1, &sp20);
    func_80093D60(temp_s1_3, 4, 1, 0x13, 0x100100, 1, &sp24);
    func_80093D60(temp_s2_3, 0, 0, 0x14, 0x1000, 1, &sp20);
    func_80093D60(temp_s2_3, 0, 1, 0x14, 0x100, 1, &sp24);
    func_80093D60(temp_s1_3, 4, 0, 0x14, 0x101000, 1, &sp20);
    func_80093D60(temp_s1_3, 4, 1, 0x14, 0x100100, 1, &sp24);
    func_80093D60(D_800E6658, 0, 0, 0x15, 0x1000, 1, &sp20);
    func_80093D60(D_800E6658, 0, 1, 0x15, 0x100, 1, &sp24);
    func_80093D60(D_800E6764, 0, 0, 0x16, 0x1000, 1, &sp20);
    func_80093D60(D_800E6764, 0, 1, 0x16, 0x100, 1, &sp24);
    func_8003AE80(D_80080CFC, D_80080CFC + 0x6E);
    func_8003AE80(D_80080CFC + 0x214C, D_80080CFC + 0x21BA);
    func_80024E9C();
    func_80024F5C();
    func_8003EB78();
}
