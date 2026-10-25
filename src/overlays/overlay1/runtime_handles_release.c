#include "types.h"

extern s16 D_8006B9C6;
extern s16 D_8006B9C8;
extern u8 D_8006B948[];
extern void func_800AADA8(s16 handle);
extern void func_8003E23C(void *state);
extern void func_800AEA9C(s32 value);

void runtime_handles_release(void)
{
    func_800AADA8(D_8006B9C6);
    func_800AADA8(D_8006B9C8);
    func_8003E23C(D_8006B948);
    func_800AEA9C(0);
    D_8006B9C6 = -1;
    D_8006B9C8 = -1;
}
