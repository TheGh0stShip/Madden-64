#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000C940(s32, s32, s32);       /* extern */
s32 func_8000C964(s32, s32, s32);       /* extern */
s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80032F3C(s32, void *);             /* extern */
s32 func_800DD634();                            /* extern */
extern s32 D_80087AA4;
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_800A0FD4(void *arg0) {
    void *temp_s0;

    func_800DD634();
    temp_s0 = (*(void **)((u8 *)(arg0) + 0x60));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(temp_s0) + 0)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(temp_s0) + 0)));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(temp_s0) + 4)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(temp_s0) + 4)));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(temp_s0) + 8)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(temp_s0) + 8)));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(temp_s0) + 0xC)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(temp_s0) + 0xC)));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(temp_s0) + 0x10)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(temp_s0) + 0x10)));
    func_80032F3C(0, temp_s0);
    func_8000C940(D_80087AA4, 0, 0);
    func_8000C964(D_80087AA4, 0x140, 0xF0);
}
