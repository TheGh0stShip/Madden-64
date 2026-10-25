#include "types.h"

extern s16 D_8006B9C2;
extern u8 D_8006B948[];
extern void func_800AADA8(s16 handle);
extern void func_8003E23C(void *state);
extern void func_800AE700(void);
extern void func_800AEA9C(s32 value);

void secondary_handle_release(void)
{
    if (D_8006B9C2 != -1) {
        func_800AADA8(D_8006B9C2);
        D_8006B9C2 = -1;
        func_8003E23C(D_8006B948);
        func_800AE700();
        func_800AEA9C(0);
    }
}
