#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s16 func_800D6454(void *);                          /* extern */
s32 func_800D67B8(void *);                            /* extern */
extern s32 D_800C3150;
extern s32 D_800C3154;
extern s32 D_800C3310;

s16 func_800B456C(void *arg0) {
    func_800D67B8(arg0);
    (*(s32 *)((u8 *)(arg0) + 0x18)) = 1;
    (*(s32 **)((u8 *)(arg0) + 4)) = &D_800C3310;
    (*(s32 **)((u8 *)(arg0) + 0xC)) = &D_800C3150;
    (*(s32 **)((u8 *)(arg0) + 0x10)) = &D_800C3154;
    return func_800D6454(arg0);
}
