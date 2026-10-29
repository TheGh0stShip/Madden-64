#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002FF70(s32);                         /* extern */
void *func_800301E0(s32, s32);                       /* extern */
extern s8 D_80071968;

void func_800949C0(s32 arg0) {
    s32 temp_a0;
    void *temp_v0;

    temp_v0 = func_800301E0(arg0, 0);
    temp_a0 = (*(s32 *)((u8 *)(temp_v0) + 0x1C));
    if (temp_a0 < 4) {
        (*(s32 *)((u8 *)(temp_v0) + 0x1C)) = (s32) (temp_a0 + 6);
        return;
    }
    (*(s32 *)((u8 *)(temp_v0) + 0x1C)) = 4;
    func_8002FF70(arg0);
    D_80071968 = 0;
}
