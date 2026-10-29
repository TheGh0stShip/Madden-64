#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80024E9C();                            /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_800D57CC();                            /* extern */
s32 func_800D5D28();                            /* extern */
s32 func_800D628C(s32);                         /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD788(s32);                     /* extern */
extern s32 D_800C5094;
extern s32 D_800C5CDC;
extern s32 D_800C5CE4;

void func_800A9BC4(s32 arg0) {
    void *temp_v0;

    func_800D5D28();
    func_800D628C(arg0);
    func_800DD788(0x11);
    func_80024E9C();
    func_800D57CC();
    func_80032F3C(0, D_800C5094);
    func_80032F3C(0, D_800C5CDC);
    func_80032F3C(0, D_800C5CE4);
    temp_v0 = func_800DD634();
    (*(s32 *)((u8 *)(temp_v0) + 0x24)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x28)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x2C)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x30)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x40)) = 0;
    (*(s32 *)((u8 *)(temp_v0) + 0x44)) = 0;
}
