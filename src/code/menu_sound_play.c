#include "types.h"

extern s16 func_8003CBB8(void);
extern void func_8003CE88(s32, s16, s32);

void menu_sound_play(s32 mode)
{
    s32 first = 0;
    s32 second = 0;

    mode &= 0xFFFF;
    switch (mode) {
    case 0:
        first = 9;
        second = 11;
        break;
    case 1:
        first = mode + 8;
        second = 13;
        break;
    case 2:
        first = 9;
        second = 13;
        break;
    case 3:
        first = 8;
        second = 13;
        break;
    }
    func_8003CE88(first, (second + 1) * 3 + func_8003CBB8() * 10 + 60, 16);
}
