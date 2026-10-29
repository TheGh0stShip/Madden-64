#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FC4(u16);                         /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_800D628C(s32);                         /* extern */
void *func_800DD634();                              /* extern */
extern u16 D_800C3A1C;
extern s32 D_800C5094;

void func_800AFF34(s32 arg0) {
    void *temp_v0;
    s32 table;

    temp_v0 = func_800DD634();
    table = D_800C5094;
    (*(s32 *)((u8 *)(temp_v0) + 0x14)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x18)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x20)) = 0;
    func_80032F3C(0, table);
    func_800D628C(arg0);
    func_80016FC4(D_800C3A1C);
}
