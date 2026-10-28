#include "types.h"

typedef struct {
    u8 unk0000[0x209A];
    u16 active;
    u8 unk209C[0xB0];
} TeamState;

extern TeamState D_80080CFC[];
extern s32 D_80080C10;
extern s16 D_80087AAC;

s32 func_800A3330(s16 team) {
    if (D_80080CFC[team].active != 0 && !(D_80080C10 & 0x84000) &&
        (D_80087AAC != 0 || (D_80080C10 & 0x100000)) && !(D_80080C10 & 0xC0000000)) {
        return 1;
    }
    return 0;
}
