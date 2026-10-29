#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000C8A0(s32);                             /* extern */
s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_800DD634();                            /* extern */
extern s32 D_80088090;
extern s32 D_8008931C;

void func_80097D60(void *arg0) {
    s32 temp_s0;
    s32 temp_s1;
    s32 temp_s2;

    func_800DD634();
    temp_s1 = (*(s32 *)((u8 *)(arg0) + 0x3C));
    temp_s2 = (*(s32 *)((u8 *)(arg0) + 0x40));
    temp_s0 = (*(s32 *)((u8 *)(arg0) + 0x44));
    func_8000D874(func_8000C8A0(D_80088090), temp_s1);
    func_8000D834(D_8008931C, temp_s1);
    func_8000D874(func_8000C8A0(D_80088090), temp_s2);
    func_8000D834(D_8008931C, temp_s2);
    func_8000D874(func_8000C8A0(D_80088090), temp_s0);
    func_8000D834(D_8008931C, temp_s0);
}
