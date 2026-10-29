#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002FFEC(s32 *);                   /* extern */
extern void *D_80071964;
extern s8 D_80071968;
extern s32 D_80094914;

void func_8009491C(void) {
    s32 temp_a0;

    temp_a0 = (*(s32 *)((u8 *)(D_80071964) + 0x1C));
    if (temp_a0 < 4) {
        (*(s32 *)((u8 *)(D_80071964) + 0x1C)) = (s32) (temp_a0 + 6);
        return;
    }
    (*(s32 *)((u8 *)(D_80071964) + 0x1C)) = 4;
    func_8002FFEC(&D_80094914);
    D_80071968 = 0;
}
