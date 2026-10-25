#include "types.h"

extern s16 D_80089320;
extern s16 D_80088AE4;
extern void *D_80084F34;
extern s32 D_80085040;
extern s16 func_8001FA68(s32 value, void *selection, void *arg2, void *arg3);
extern void func_8009CBB8(s32 value, s32 duration);

void menu_selection_confirm(void)
{
    if (D_80089320 != -1 &&
        func_8001FA68(10, (void *)*(&D_80085040 + D_80088AE4 * 22), D_80084F34, D_80084F34) == 1) {
        func_8009CBB8(0x2D, 0xD2);
    }
}
