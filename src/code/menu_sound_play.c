#include "types.h"

extern s16 func_8003CBB8(void);
extern void func_8003CE88(s32, s16, s32);

void menu_sound_play(s32 mode)
{
    s32 first = 0;
    s32 second = 0;

    mode &= 0xFFFF;
    if (mode == 1) goto case_1;
    if (mode < 2) {
        if (mode == 0) goto case_0;
        goto done;
    }
    if (mode == 2) goto case_2;
    if (mode == 3) goto case_3;
    goto done;
case_0:
    first = 9;
    second = 11;
    goto done;
case_1:
    first = mode + 8;
    goto common_13;
case_2:
    first = 9;
    goto common_13;
case_3:
    first = 8;
common_13:
    second = 13;
done:
    func_8003CE88(first, (second + 1) * 3 + func_8003CBB8() * 10 + 60, 16);
}
