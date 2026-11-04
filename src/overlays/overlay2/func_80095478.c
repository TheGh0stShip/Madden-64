#include "types.h"

typedef struct {
    s8 scored;
    s8 allowed;
    u8 rest[12];
} Entry14;

extern Entry14 D_800C5896[];
extern s8 D_800C509C;
extern u8 D_800C3978;

u16 func_80028A58(u16);

u8 func_80095478(u16 a, u16 b) {
    s32 i;
    s32 diff;

    if (D_800C509C >= 4) {
        i = func_80028A58(a);
        diff = D_800C5896[i].scored;
        diff -= D_800C5896[i].allowed;
        if (diff < 0) {
            diff = -diff;
        }
        diff = diff < 2;
        if (diff) {
            i = func_80028A58(b);
            diff = D_800C5896[i].scored;
            diff -= D_800C5896[i].allowed;
            if (diff < 0) {
                diff = -diff;
            }
            diff = diff < 2;
            if (diff) {
                return D_800C3978;
            }
        }
    }
    return 0;
}
