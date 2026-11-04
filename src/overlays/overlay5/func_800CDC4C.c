#include "types.h"

extern s8 D_80084FA8;
extern s8 D_8008B358;
extern s16 D_8007A308;
extern u16 D_8007A30C;
extern s16 D_8007A314[];
extern u16 D_800E74B4;
extern s16 D_800E74B6;
extern u8 D_800E74B9;
extern s32 func_8002209C(u16, u16, u16);
extern u8 func_80022AD8(u16, u16);
extern s32 func_8003FC94(s8, s16);
extern s32 func_80022234(u16, u16);
extern s32 func_800D4A90(s16, u8);

void func_800CDC4C(void) {
    u32 i;
    s16 value;
    s32 selected;
    u8 code;

    D_8007A308 = 0;
    i = 0;
    do {
        if ((s16)func_8002209C((u16)(s8)D_80084FA8, i,
                               (u16)(s8)D_8008B358) == -1) {
            code = func_80022AD8((u16)(s8)D_80084FA8, i);
            if (code != 0xFF) {
                value = func_8003FC94(D_80084FA8, (s16)i);
                if (value == 1) {
                    selected = (s16)func_80022234((u16)(s8)D_8008B358,
                                                  D_8007A30C);
                    code = func_80022AD8((u16)(s8)D_80084FA8, i);
                    if ((s16)func_800D4A90(selected, code & 0x3F) != 0) {
                        D_8007A314[D_8007A308] = i;
                        D_8007A308++;
                    }
                }
            }
        }
        i++;
    } while (i < 0x37);
    D_800E74B4 = D_8007A308;
    D_800E74B6 = 0;
    D_800E74B9 = 0;
}
