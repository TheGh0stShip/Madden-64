#include "types.h"

extern s16 D_8006BA22;
extern u16 D_800857B2;
extern u16 D_80085280;
extern s16 D_80088AE4;
extern s16 D_800886E0;

void func_800DD6EC(void);
s16 menu_mode_process(s32, s16 *, u16 *);
void mode_resource_update(s32, s16, u16, u16, u16);

void menu_mode_update(void) {
    s8 values[2];
    s16 x;
    u16 y;
    s16 i;

    if (D_8006BA22 != 0) {
        func_800DD6EC();
        values[D_80088AE4] = D_800857B2;
        values[D_800886E0] = D_80085280;
        i = menu_mode_process(5, &x, &y);
        mode_resource_update(6, x, i, y, values[i]);
        i = menu_mode_process(10, &x, &y);
        mode_resource_update(7, x, i, y, values[i]);
        i = menu_mode_process(14, &x, &y);
        mode_resource_update(8, x, i, y, values[i]);
        i = menu_mode_process(20, &x, &y);
        mode_resource_update(9, x, i, y, values[i]);
        i = menu_mode_process(17, &x, &y);
        mode_resource_update(10, x, i, y, values[i]);
        i = menu_mode_process(24, &x, &y);
        mode_resource_update(11, x, i, y, values[i]);
        i = menu_mode_process(16, &x, &y);
        mode_resource_update(12, x, i, y, values[i]);
        i = menu_mode_process(49, &x, &y);
        mode_resource_update(13, x, i, y, values[i]);
    }
}
