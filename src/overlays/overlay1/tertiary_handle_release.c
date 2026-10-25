#include "types.h"

extern s16 D_8006B9BC;
extern void func_800AADA8(s16 handle);

void tertiary_handle_release(void)
{
    if (D_8006B9BC != -1) {
        func_800AADA8(D_8006B9BC);
        D_8006B9BC = -1;
    }
}
