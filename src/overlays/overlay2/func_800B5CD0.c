#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80017C24(s32);                         /* extern */
s32 func_80024E9C();                            /* extern */
s32 func_80032F3C(s32, s32);                /* extern */
s32 func_800B41D4(s32);                         /* extern */
s32 func_800D57CC();                            /* extern */
s32 func_800D628C(void *);                      /* extern */
void *func_800DD634();                              /* extern */
s32 func_800DD788(s32);                     /* extern */
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_800B5CD0(void *arg0) {
    s32 temp_s2;
    void *temp_s1;

    func_80024E9C();
    temp_s1 = func_800DD634();
    temp_s2 = (*(s32 *)((u8 *)(arg0) + 0x60));
    func_800B41D4(temp_s2);
    func_80032F3C(0, temp_s2);
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x78)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x7C)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x80)));
    func_80032F3C(0, (*(s32 *)((u8 *)(arg0) + 0x84)));
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(arg0) + 0x3C)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(arg0) + 0x3C)));
    (*(s32 *)((u8 *)(temp_s1) + 0x14)) = 0;
    (*(s32 *)((u8 *)(temp_s1) + 0x18)) = 0;
    (*(s32 *)((u8 *)(temp_s1) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(temp_s1) + 0x20)) = 0;
    func_80017C24((*(s32 *)((u8 *)(temp_s1) + 0x48)));
    (*(s32 *)((u8 *)(temp_s1) + 0x48)) = 0;
    func_800DD788(0x12);
    func_800D57CC();
    (*(s32 *)((u8 *)(temp_s1) + 0x44)) = 0;
    func_800D628C(arg0);
}
