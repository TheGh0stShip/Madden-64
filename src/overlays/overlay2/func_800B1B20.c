#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80092B98();                            /* extern */
s32 func_800B1694(void *);                      /* extern */
s32 func_800B17A0(void *);                      /* extern */
s32 func_800B1BD0(void *, s32);             /* extern */
s32 func_800DD4B8();                            /* extern */
s32 func_800E08A4(s32);                         /* extern */

void func_800B1B20(void *arg0) {
    u8 temp_v1;
    void *temp_a0;
    void *temp_s0;
    void *temp_v1_2;

    temp_s0 = (*(void **)((u8 *)(arg0) + 0x60));
    temp_v1 = (*(u8 *)((u8 *)(temp_s0) + 0));
    switch (temp_v1) {                              /* irregular */
    case 0:
        func_800DD4B8();
        return;
    case 1:
        temp_a0 = (*(void **)((u8 *)(temp_s0) + 0x20));
        (*(s32 *)((u8 *)(temp_a0) + 0x14)) = (s32) ((*(s32 *)((u8 *)(temp_a0) + 0x14)) & ~1);
        temp_v1_2 = (*(void **)((u8 *)(temp_s0) + 0x1C));
        (*(s32 *)((u8 *)(temp_v1_2) + 0x14)) = (s32) ((*(s32 *)((u8 *)(temp_v1_2) + 0x14)) | 1);
        func_800E08A4((*(s32 *)((u8 *)(temp_s0) + 0x24)));
        func_800B1BD0(temp_s0, 1);
        func_800B1694(arg0);
        (*(u8 *)((u8 *)(temp_s0) + 0)) = 0U;
        func_800B17A0(temp_s0);
        func_80092B98();
        return;
    }
}
