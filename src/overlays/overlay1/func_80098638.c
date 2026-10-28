#include "types.h"

typedef struct {
    u8 unk0000[0x20C4];
    s16 mode;
    u8 unk20C6[0x86];
} TeamState;

extern u16 D_8006B7AC[];
extern TeamState D_80080CFC[];
extern s32 D_80084F34;
extern s16 D_800886E0;
extern s16 D_80089320;

u16 func_80031A1C(s32);
s32 func_800DEC38(void);

void func_80098638(void) {
    if (D_80089320 == -1) {
        return;
    }
    switch (D_80080CFC[D_800886E0].mode) {
        case 3:
        case 15:
        case 16:
        case 17:
        case 18:
            if ((u32)(func_800DEC38() - 3) < 2) {
                D_8006B7AC[0] |= 0x2000;
            } else if (D_80084F34 > 0x01DFFFFF) {
                if (D_80089320 >= 3 || func_80031A1C(100) < 40) {
                    D_8006B7AC[0] |= 0x2000;
                }
            } else if (D_80089320 >= 3 && func_80031A1C(100) < 20) {
                D_8006B7AC[0] |= 0x2000;
            }
            break;
    }
}
