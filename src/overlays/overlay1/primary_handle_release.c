#include "types.h"

extern s16 D_8006B9C0;
extern void func_800AADA8(s16 handle);

void primary_handle_release(void)
{
    if (D_8006B9C0 != -1) {
        func_800AADA8(D_8006B9C0);
        D_8006B9C0 = -1;
    }
}
