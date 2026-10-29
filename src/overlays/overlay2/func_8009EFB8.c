#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
s32 func_80032F3C(s32, void *);             /* extern */
s32 func_800D6370(s32);                         /* extern */
s32 func_800DB1F8(void *);                      /* extern */
void *func_800DD634();                              /* extern */
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_8009EFB8(void *arg0) {
    void *temp_s1;
    void *temp_s2;
    void *temp_s3;

    temp_s3 = func_800DD634();
    func_80032F3C(0, (*(void **)((u8 *)(arg0) + 0x60)));
    func_800D6370((*(s32 *)((u8 *)(arg0) + 0x38)));
    temp_s1 = (*(void **)((u8 *)(arg0) + 0x24));
    temp_s2 = (*(void **)((u8 *)(temp_s1) + 0xC));
    func_800DB1F8(temp_s1);
    func_80032F3C(0, temp_s2);
    func_80032F3C(0, temp_s1);
    func_8000D874(D_80087AA8, (*(s32 *)((u8 *)(arg0) + 0x28)));
    func_8000D834(D_8008931C, (*(s32 *)((u8 *)(arg0) + 0x28)));
    (*(void **)((u8 *)(arg0) + 0x24)) = NULL;
    (*(s32 *)((u8 *)(arg0) + 0x28)) = 0;
    (*(s32 *)((u8 *)(arg0) + 0x38)) = 0;
    (*(s32 *)((u8 *)(temp_s3) + 0x1C)) = 0;
    (*(s32 *)((u8 *)(temp_s3) + 0x20)) = 0;
}
