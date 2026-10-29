#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_800167FC(s16);                         /* extern */
s32 func_8002E65C(s32, s32 *);          /* extern */
extern s32 D_8006BFA0;
extern void *D_800C5094;

void func_800AFF9C(s32 arg0, s32 arg1) {
    if ((arg0 & 0xFFFF) >= (*(s16 *)((u8 *)(D_800C5094) + 0x320))) {
        func_8002E65C(arg1, &D_8006BFA0);
        return;
    }
    func_800167FC((s16) (arg0 + 1));
}
