#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8001EC20(s32, s32);                /* extern */

void func_800A04FC(void *arg0, void *arg1) {
    (*(s32 *)((u8 *)(arg0) + 0x198)) = (s32) (*(s32 *)((u8 *)(arg1) + 0x84));
    (*(s32 *)((u8 *)(arg0) + 0x19C)) = (s32) (*(s32 *)((u8 *)(arg1) + 0x1C));
    (*(s32 *)((u8 *)(arg0) + 0x1A0)) = (s32) (*(s32 *)((u8 *)(arg1) + 0xA0));
    (*(s32 *)((u8 *)(arg0) + 0x1A4)) = (s32) (*(s32 *)((u8 *)(arg1) + 0x38));
    (*(s32 *)((u8 *)(arg1) + 0x84)) = 0;
    (*(s32 *)((u8 *)(arg1) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(arg1) + 0xA0)) = 0;
    (*(s32 *)((u8 *)(arg1) + 0x38)) = 0;
    (*(s32 *)((u8 *)(arg0) + 0x194)) = 0;
    func_8001EC20((*(s32 *)((u8 *)(arg0) + 0)), 0x21);
    func_8001EC20((*(s32 *)((u8 *)(arg0) + 0)), 7);
    func_8001EC20((*(s32 *)((u8 *)(arg0) + 4)), 0x28);
    func_8001EC20((*(s32 *)((u8 *)(arg0) + 4)), 0xE);
    (*(s32 *)((u8 *)(arg0) + 0x190)) = 0;
}
