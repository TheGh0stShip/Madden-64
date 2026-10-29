#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FF4(void *);                      /* extern */
s32 func_8002FFEC(s32 *);                   /* extern */
extern void *D_80071964;
extern s8 D_80071968;
extern s32 D_800948BC;

void func_800948C4(void) {
    s32 temp_v1;

    temp_v1 = (*(s32 *)((u8 *)(D_80071964) + 0x1C));
    if (temp_v1 >= -0x51) {
        (*(s32 *)((u8 *)(D_80071964) + 0x1C)) = (s32) (temp_v1 - 6);
        return;
    }
    func_80016FF4(D_80071964);
    func_8002FFEC(&D_800948BC);
    D_80071968 = 0;
}
