#include "types.h"

typedef struct {
    u16 slot[55];
} Team;

typedef struct {
    u8 pad00[0xC];
    s16 total;
} Summary;

extern Team D_80080CFC;

s16 func_80022B3C(s32, u16, s32);

void func_800B3FE4(Summary *summary) {
    s16 total = 0;
    u16 i;

    for (i = 0; i < 55; i++) {
        if (D_80080CFC.slot[i] == 0xFFFF) {
            break;
        }
        total += func_80022B3C(0, i, 0x13);
    }
    summary->total = total;
}
