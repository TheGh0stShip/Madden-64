#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80030C74(s32 *);                       /* extern */
s32 func_800A6FA0(void *);                      /* extern */
extern u16 D_8008A5B4;

void func_800A6F40(void *arg0) {
    s32 sp10;
    void *temp_s1;

    temp_s1 = (*(void **)((u8 *)(arg0) + 0x60));
    func_80030C74(&sp10);
    if (!(sp10 & 4)) {
        (*(s32 *)((u8 *)(temp_s1) + 4)) = (s32) (D_8008A5B4 + (*(s32 *)((u8 *)(temp_s1) + 4)));
        func_800A6FA0(arg0);
    }
}
