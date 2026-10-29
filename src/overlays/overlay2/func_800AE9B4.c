#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80024694();                            /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_800AE460(void *);                      /* extern */
s32 func_800AE734(void *, u16);                 /* extern */
s32 func_800AEAFC(void *);                      /* extern */
s32 func_800AEB4C(void *);                      /* extern */
s32 func_800AF0DC(void *, s32, s32);        /* extern */
s32 func_800AF1D4(u8);                              /* extern */
s32 func_800DB2A4(s32);                         /* extern */

void func_800AE9B4(void *arg0) {
    s32 temp_s2;
    s32 temp_v1;
    void *temp_s0;

    temp_s0 = (*(void **)((u8 *)(arg0) + 0x60));
    temp_v1 = (*(s32 *)((u8 *)(temp_s0) + 0));
    temp_s2 = (*(s32 *)((u8 *)((*(void **)((u8 *)(arg0) + 0x24))) + 0xC));
    switch (temp_v1) {                              /* irregular */
    case 0:
        func_800AEAFC(arg0);
        (*(u8 *)((u8 *)(temp_s0) + 0x14)) = 1U;
        (*(u16 *)((u8 *)(temp_s0) + 0xA)) = (u16) (*(u16 *)((u8 *)(temp_s0) + 8));
        func_800AE734(arg0, (*(u16 *)((u8 *)(temp_s0) + 4)));
        func_800AF0DC(arg0, func_800AF1D4((*(u8 *)((u8 *)(temp_s0) + 0x14))) & 0xFFFF, 7);
        (*(s32 *)((u8 *)(temp_s0) + 0)) = 1;
        func_800AE460(arg0);
        return;
    case 1:
        func_800AEB4C(arg0);
        func_800DB2A4(temp_s2);
        func_80024E9C();
        func_80024694();
        return;
    }
}
