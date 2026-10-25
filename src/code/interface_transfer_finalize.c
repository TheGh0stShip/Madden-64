#include "types.h"

extern u16 D_8006B9D8;
extern u16 D_8006B9DA;
extern void *D_8006B9DC;
extern u8 D_8000105C[];
extern void func_800E2190(void *descriptor, void *buffer, s32 value);
extern void func_80032F3C(s32 value, void *buffer);

void interface_transfer_finalize(void)
{
    u16 state = D_8006B9D8;

    if (state != 0) {
        if (state == 4) {
            D_8006B9D8 = 3;
            return;
        }
        func_800E2190(D_8000105C, D_8006B9DC, 1);
        func_80032F3C(0, D_8006B9DC);
        D_8006B9DC = 0;
        D_8006B9DA = D_8006B9D8;
    }
    D_8006B9D8 = 3;
}
