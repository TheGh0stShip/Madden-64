#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8001FA50(s32, u8);                     /* extern */
s32 func_80030C74(s32 *);                       /* extern */
s32 func_8003FD70(u8);                          /* extern */
s32 func_8003FD84();                          /* extern */
extern s16 D_80064A4A;
extern s32 D_800696D8;
extern u8 D_800724A8;
extern s16 D_800740E0;
extern u8 D_80074808;
extern u16 D_80087962;
extern u8 D_80087965;
extern u8 D_80087966;
extern u8 D_80087967;
extern u8 D_80087968;
extern u8 D_80087969;
extern u8 D_8008796A;
extern u8 D_80087974[];
extern u16 D_80087A60;
extern s16 D_8008A5B0;

void func_80096428(void) {
    s32 sp10;
    s32 temp_a0;
    s32 var_s0;
    u8 temp_a1;

    if (D_8008A5B0 != 2) {
        D_80087A60 = D_80087962;
    }
    func_80030C74(&sp10);
    if ((sp10 & 0x2400) == 0x2400) {
        D_80087A60 = 0x1E;
    }
    D_80064A4A = (s16) D_80087965;
    D_800696D8 = (s32) D_80087966;
    if (D_80087967 != 0) {
        func_8003FD70(D_80087967);
    } else {
        func_8003FD84();
    }
    var_s0 = 0;
    D_800740E0 = (s16) D_80087968;
    D_800724A8 = D_80087969;
    D_80074808 = D_8008796A;
    do {
        func_8001FA50(var_s0 & 0xFFFF, D_80087974[var_s0]);
        var_s0 += 1;
    } while (var_s0 < 0x13);
}
