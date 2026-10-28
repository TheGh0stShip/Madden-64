#include "types.h"

typedef struct {
    s16 value;
    s16 pad;
} Slot;

typedef struct {
    u8 pad00[8];
    Slot slots[2][18];
    u8 gap[2][7];
    u8 negative[2][7];
} Board;

extern Board *D_8006EA74;
extern s32 D_8006EA7C[7];
extern s32 D_8006EA98[7];

void func_800B4C6C(void) {
    u32 side;
    u32 i;
    s32 pass;
    s32 settled;
    s32 diff;

    for (side = 0; side < 2; side++) {
        pass = 0;
        do {
            settled = 1;
            for (i = 0; i < 7; i++) {
                diff = D_8006EA74->slots[side][D_8006EA7C[i]].value - D_8006EA74->slots[(side + 1) & 1][D_8006EA98[i]].value;
                if (diff < 0) {
                    diff = -diff;
                    D_8006EA74->negative[side][i] = 1;
                } else {
                    D_8006EA74->negative[side][i] = 0;
                }
                diff += pass & 0xFF;
                if (diff < 6) {
                    D_8006EA74->gap[side][i] = 0;
                } else {
                    settled = 0;
                    D_8006EA74->gap[side][i] = diff;
                }
            }
            pass++;
        } while (settled == 1);
    }
}
