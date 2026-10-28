#include "types.h"

extern u8 *D_80086178;
extern s32 func_8001FA38(s32 group);
extern void func_8001FA50(s32 group, s32 value);
extern s16 func_8001FA68(s32 group, s32 option, u32 value, u32 duplicate);
extern void func_8009CBB8(s32 command, s32 value);

void menu_option_dispatch(s32 option)
{
    s32 saved_option = option;
    s32 saved_value;
    u32 value;

    saved_value = func_8001FA38(7);
    func_8001FA50(7, 8);
    value = *(u32 *)(D_80086178 + 0x20);
    if (func_8001FA68(7, saved_option, value, value) == 1) {
        func_8009CBB8(0x2D, 0xD2);
    }
    func_8001FA50(7, (s16)saved_value);
}
