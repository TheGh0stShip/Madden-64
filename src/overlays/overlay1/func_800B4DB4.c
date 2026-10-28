#include "types.h"

typedef struct {
    u16 total[4];
    u8 pad08[0x90];
    u8 homeGain[7];
    u8 awayGain[7];
    u8 homeLoss[7];
    u8 awayLoss[7];
    u8 padB4[0x18];
    s8 result[2];
} Stats;

extern Stats *D_8006EA74;

void func_800B4DB4(void) {
    u32 i;
    s32 value;
    s16 diff;
    s16 back;

    D_8006EA74->total[0] = 0;
    D_8006EA74->total[1] = 0;
    D_8006EA74->total[2] = 0;
    D_8006EA74->total[3] = 0;
    for (i = 0; i < 7; i++) {
        value = D_8006EA74->homeGain[i];
        if (D_8006EA74->homeLoss[i] == 1) {
            value = -value;
        }
        D_8006EA74->total[0] += value;
        D_8006EA74->total[3] -= value;
    }
    for (i = 0; i < 7; i++) {
        value = D_8006EA74->awayGain[i];
        if (D_8006EA74->awayLoss[i] == 1) {
            value = -value;
        }
        D_8006EA74->total[2] += value;
        D_8006EA74->total[1] -= value;
    }
    for (i = 0; i < 2; i++) {
        diff = D_8006EA74->total[2 + i] - D_8006EA74->total[2 + ((i + 1) & 1)];
        back = D_8006EA74->total[2 + ((i + 1) & 1)] - D_8006EA74->total[2 + i];
        if ((u16)(diff + 5) < 11) {
            D_8006EA74->result[i] = 0;
        } else if (diff < -10 && -back < -10) {
            D_8006EA74->result[i] = 1;
        } else {
            D_8006EA74->result[i] = 2;
        }
    }
}
