#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800A6580();                                /* extern */
extern s16 D_8008807C;

void func_800C1538(void *arg0) {
    (*(s32 *)((u8 *)(arg0) + 0x14)) = (s32) ((*(s32 *)((u8 *)(arg0) + 0x14)) & ~1);
    if (((u32) ((func_800A6580() - 7) & 0xFF) >= 2U) && (D_8008807C == 1) && ((*(s32 *)((u8 *)((*(void **)((u8 *)((((*(u16 *)((u8 *)(arg0) + 0x3C)) * 4) + 0x80080000)) + 0x6C40))) + 0x14)) & 1)) {
        (*(s32 *)((u8 *)(arg0) + 0x14)) = (s32) ((*(s32 *)((u8 *)(arg0) + 0x14)) | 1);
    }
}
