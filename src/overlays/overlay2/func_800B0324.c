#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8002E65C(void *, s32 *);           /* extern */
extern s32 D_8006BFA0;
extern void *D_800C5094;

void func_800B0324(s32 arg0, void *arg1) {
    if ((arg0 & 0xFFFF) >= (*(s16 *)((u8 *)(D_800C5094) + 0x320))) {
        func_8002E65C(arg1, &D_8006BFA0);
        return;
    }
    (*(s8 *)((u8 *)(arg1) + 0)) = 0x2D;
    (*(s8 *)((u8 *)(arg1) + 1)) = 0;
}
