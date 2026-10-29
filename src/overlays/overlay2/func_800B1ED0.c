#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_80016FC4(u16);                         /* extern */
s32 func_80016FD4();                                /* extern */
s32 func_80017B80(s32);                         /* extern */
s32 func_80017C24(s32);                         /* extern */
s32 func_80092B98();                            /* extern */
void *func_800DD634();                              /* extern */
extern u16 D_80084F40;
extern s32 D_800C48B8[];

void func_800B1ED0(void *arg0) {
    s32 temp_a0;
    s32 temp_s1;
    s32 temp_s3;
    void *temp_s0;

    temp_s0 = func_800DD634();
    temp_s3 = func_80016FD4();
    func_80016FC4(D_80084F40);
    temp_s1 = (*(s32 *)((u8 *)(temp_s0) + 0x48));
    (*(s32 *)((u8 *)(temp_s0) + 0x48)) = 0;
    func_80092B98();
    func_80092B98();
    func_80017C24(temp_s1);
    temp_a0 = D_800C48B8[*(u16 *)((u8 *)arg0 + 2)];
    (*(s32 *)((u8 *)(temp_s0) + 0x48)) = temp_a0;
    func_80017B80(temp_a0);
    func_80016FC4(temp_s3 & 0xFFFF);
}
