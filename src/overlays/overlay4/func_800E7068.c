#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000B614();                            /* extern */
s32 func_8000B7E4(s32);                         /* extern */
s32 func_8000BE80();                            /* extern */
s32 func_8000BF08();                            /* extern */
s32 func_8000C930(s32 *, s32, s32, s32); /* extern */
s32 func_8000D4AC();                            /* extern */
s32 func_8000D684(s32);                         /* extern */
s32 func_8000DDE8();                            /* extern */
s32 func_80011A98();                                /* extern */
s32 func_80016EE4();                            /* extern */
s32 func_80016FD4();                                /* extern */
s32 func_8002E9E8(s32);                     /* extern */
s32 func_8002FE58();                            /* extern */
s32 func_800334B8();                            /* extern */
s32 func_80035A7C(u16);                         /* extern */
s32 func_800395AC();                            /* extern */
s32 func_8003CA4C();                            /* extern */
s32 func_8003CB98(u16);                         /* extern */
s32 func_80041660();                            /* extern */
s32 func_80044AB8();                            /* extern */
s32 func_80045794();                            /* extern */
s32 func_8009506C();                            /* extern */
s32 func_800967CC();                            /* extern */
s32 func_800971DC();                            /* extern */
s32 func_800B1F30();                            /* extern */
s32 func_800B95A8();                            /* extern */
s32 func_800BF93C();                            /* extern */
s32 func_800E0BBC();                            /* extern */
extern u16 D_8007AB30;
extern u16 D_8007AB40;
extern s32 *D_80086DD8;
extern s32 D_80087A64;
extern s32 D_80087AA4;
extern s32 D_80087AA8;
extern s32 D_80088090;
extern u16 D_800886FC;
extern s16 D_8008A5B0;
extern s32 D_8008B3D0;
extern s32 D_800908B8;

void func_800E7068(void) {
    func_800B1F30();
loop_1:
    if (func_80011A98() & 0xFFFF) {
        func_8000BF08();
        goto loop_1;
    }
    func_8000BE80();
    func_80041660();
    func_8003CA4C();
    func_800E0BBC();
    func_800BF93C();
    func_8002E9E8(4);
    func_800395AC();
    func_800967CC();
    func_8000D684(D_80087A64);
    func_8000D684(D_80087AA8);
    func_800B95A8();
    func_8000B7E4(D_80088090);
    func_8000B7E4(D_80087AA4);
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
    func_8000BF08();
    func_80016EE4();
    func_800971DC();
    func_80045794();
    func_8000DDE8();
    func_80044AB8();
    func_80035A7C(D_800886FC);
    func_80035A7C(func_80016FD4() & 0xFFFF);
    func_80035A7C(D_8007AB30);
    func_8000D4AC();
    func_8009506C();
    func_8002FE58();
    func_8000B614();
    func_800334B8();
    func_8003CB98(D_8007AB40);
    D_80086DD8 = &D_800908B8;
    D_8008A5B0 = 0;
}
