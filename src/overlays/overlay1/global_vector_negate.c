#include "types.h"

extern s32 D_8007A090;
extern s32 D_8007A094;
extern s32 D_8007A0A0;
extern s32 D_8007A0A4;

void func_800AA124(void)
{
    s32 *x0_address = &D_8007A090;
    s32 *x1_address;
    s32 x0 = *x0_address;
    s32 y0 = D_8007A094;
    s32 x1;
    s32 y1;

    x1_address = &D_8007A0A0;
    x1 = *x1_address;
    y1 = D_8007A0A4;
    *x0_address = -x0;
    D_8007A094 = -y0;
    *x1_address = -x1;
    D_8007A0A4 = -y1;
}
