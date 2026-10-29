#include "types.h"

typedef struct {
    u16 values[0x214C / 2];
} FrameHalfwords;

u8 func_80022AD8(u16, u16);
u32 func_8002A358(s32, s32);
extern FrameHalfwords D_80080CFC[];

u16 func_8002AA8C(void) {
    u32 best;
    u16 result;
    s32 team;
    s32 i;
    u32 v;

    best = 0;
    result = D_80080CFC[0].values[0];
    for (team = 0; team < 2; team++) {
        for (i = 0; i < 0x37; i++) {
            if (D_80080CFC[team].values[i] != 0xFFFF
                && func_80022AD8(team, i) >= 0xA
                && func_80022AD8(team, i) < 0x15) {
                v = func_8002A358(team, i);
                if (best < v) {
                    result = D_80080CFC[team].values[i];
                    best = v;
                }
            }
        }
    }
    return result;
}
