#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000C8A0(s32);                             /* extern */
s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80016FF4(s32);                         /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
extern void *D_80086A2C;
extern s32 D_80088090;
extern s32 D_8008931C;

void func_80098144(void) {
    func_8000D874(func_8000C8A0(D_80088090), (*(s32 *)((u8 *)(D_80086A2C) + 0xB4)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(D_80086A2C) + 0xB4)));
    func_80016FF4((*(s32 *)((u8 *)(D_80086A2C) + 0xB8)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(D_80086A2C) + 0xB8)));
    func_80032F3C(0, (*(s32 *)((u8 *)(D_80086A2C) + 0xBC)));
}
