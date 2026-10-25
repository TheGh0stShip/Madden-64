#include "types.h"

extern s16 D_80086CF2;
extern s32 D_80086D80;
extern s32 D_80086D84;
extern s32 D_80086D88;
extern s32 func_8009CA08(void);
extern void func_800A365C(s32 mode);

void conditional_mode_activate(s32 value)
{
    if (D_80086CF2 == 0 && func_8009CA08() != 0) {
        func_800A365C(6);
        D_80086D80 = 0;
        D_80086D84 = value & 0xFF;
        D_80086D88 = 0;
    }
}
