#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000BE80();                            /* extern */
s32 func_8000BEE8(s32);                     /* extern */
s32 func_8000C8A0(s32);                             /* extern */
s32 func_8000CDC0();                            /* extern */
s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D998(s32, s32);                    /* extern */
s32 func_8000DA98(s32);                         /* extern */
s32 func_80016FC4(u16);                         /* extern */
s32 func_80016FD4();                                /* extern */
s32 func_8001AAD8(u16, s32);                /* extern */
s32 func_8001AB74();                            /* extern */
s32 func_8001AC70(s32);                         /* extern */
s32 func_8001AD78(s32 *);                   /* extern */
s32 func_800334B8();                            /* extern */
s32 func_80035A7C(s32);                         /* extern */
s32 func_800B1A80();                            /* extern */
extern s32 D_8006B904;
extern s8 D_800717F8;
extern s32 D_8007A1A8;
extern s32 D_800854A0;
extern s32 D_800879AC;
extern s32 D_80087A64;
extern s32 D_80088090;
extern u16 D_8008809A;
extern u16 D_800886FC;
extern s32 D_800892D8;
extern s32 D_800892DC;
extern s32 D_800892E0;
extern s32 D_800892E4;
extern s32 D_800892E8;
extern s32 D_800892EC;
extern s32 D_800892F0;
extern s32 D_800892F4;
extern s32 D_800892F8;
extern s32 D_8008B36C;

void func_800B5E68(void) {
    func_8000BE80();
    func_8000D998(func_8000C8A0(D_80088090), D_800854A0);
    func_8000D998(func_8000C8A0(D_80088090), D_800879AC);
    func_8000DA98(D_800892D8);
    func_8000DA98(D_800892DC);
    func_8000DA98(D_800892E0);
    func_8000DA98(D_800892E4);
    func_8000DA98(D_800892F8);
    func_8000DA98(D_800892E8);
    func_8000DA98(D_800892EC);
    func_8000DA98(D_800892F0);
    func_8000DA98(D_800892F4);
    func_800B1A80();
    func_8000D834(D_80087A64, D_8008B36C);
    func_80035A7C(func_80016FD4() & 0xFFFF);
    func_80016FC4(D_8008809A);
    func_8000CDC0();
    func_800334B8();
    func_8001AB74();
    func_8001AAD8(D_800886FC, 0x2C);
    func_8001AD78(&D_8006B904);
    func_8001AC70(D_8007A1A8);
    D_800717F8 = 0;
    func_8000BEE8(0);
    func_8000CDC0();
    func_800334B8();
}
