#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000C9AC(s32, void *);                 /* extern */
s32 func_8000CA20(s32, void *);                 /* extern */
s16 func_8001A958(u16);                             /* extern */
u32 func_8001A970(s32);                             /* extern */

void func_800AABC4(void *arg0, void *arg1) {
    s16 temp_v0_4;
    s16 temp_v0_5;
    s16 temp_v0_6;
    u32 temp_v0;
    u32 temp_v0_2;
    u32 temp_v0_3;

    temp_v0 = func_8001A970((*(s32 *)((u8 *)(arg1) + 0)));
    (*(u32 *)((u8 *)(arg0) + 0x1C)) = temp_v0;
    (*(u32 *)((u8 *)(arg0) + 0x2C)) = temp_v0;
    temp_v0_2 = func_8001A970((*(s32 *)((u8 *)(arg1) + 4)));
    (*(u32 *)((u8 *)(arg0) + 0x20)) = temp_v0_2;
    (*(u32 *)((u8 *)(arg0) + 0x30)) = temp_v0_2;
    temp_v0_3 = func_8001A970((*(s32 *)((u8 *)(arg1) + 8))) >> 1;
    (*(u32 *)((u8 *)(arg0) + 0x24)) = temp_v0_3;
    (*(u32 *)((u8 *)(arg0) + 0x34)) = temp_v0_3;
    temp_v0_4 = func_8001A958((*(u16 *)((u8 *)(arg1) + 0x10)));
    (*(s16 *)((u8 *)(arg0) + 0x5C)) = temp_v0_4;
    (*(s16 *)((u8 *)(arg0) + 0x64)) = temp_v0_4;
    temp_v0_5 = func_8001A958((*(u16 *)((u8 *)(arg1) + 0x12)));
    (*(s16 *)((u8 *)(arg0) + 0x5E)) = temp_v0_5;
    (*(s16 *)((u8 *)(arg0) + 0x66)) = temp_v0_5;
    temp_v0_6 = func_8001A958((*(u16 *)((u8 *)(arg1) + 0x14)));
    (*(s16 *)((u8 *)(arg0) + 0x60)) = temp_v0_6;
    (*(s16 *)((u8 *)(arg0) + 0x68)) = temp_v0_6;
    (*(s32 *)((u8 *)(arg0) + 0x18)) = 0;
    func_8000C9AC((*(s32 *)((u8 *)(arg0) + 0x14)), arg0 + 0x5C);
    func_8000CA20((*(s32 *)((u8 *)(arg0) + 0x14)), arg0 + 0x1C);
    (*(s32 *)((u8 *)(arg0) + 0x3C)) = 0;
    (*(s32 *)((u8 *)(arg0) + 0x40)) = 0;
    (*(void **)((u8 *)(arg0) + 0x44)) = arg1;
    (*(u16 *)((u8 *)(arg0) + 0x84)) = (u16) ((*(u16 *)((u8 *)(arg0) + 0x84)) | 0x10);
}
