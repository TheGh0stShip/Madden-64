#include "types.h"
extern s32 D_800C48B8[];

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FC4(u16);                         /* extern */
s32 func_80016FD4();                                /* extern */
s32 func_80017B80(s32);                         /* extern */
void *func_800DD634();                              /* extern */
extern u16 D_80084F40;

void func_800AE870(void *arg0) {
    s32 temp_a0;
    s32 temp_s1;
    void *temp_s2;

    temp_s2 = func_800DD634();
    temp_s1 = func_80016FD4();
    func_80016FC4(D_80084F40);
    temp_a0 = D_800C48B8[*(u16 *)((u8 *)arg0 + *(u8 *)((u8 *)arg0 + 0x14) * 2 + 4)];
    (*(s32 *)((u8 *)(temp_s2) + 0x48)) = temp_a0;
    func_80017B80(temp_a0);
    func_80016FC4(temp_s1 & 0xFFFF);
}
