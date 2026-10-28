#include "types.h"

typedef struct {
    u8 pad0000[0x2098];
    s16 score;
    u8 pad209A[0x214C - 0x209A];
} Team;

typedef struct {
    u8 pad00[2];
    u16 play;
    s8 down;
} PlayState;

extern Team D_80080CFC[];
extern s32 D_8000057C;
extern s16 D_8008A5B0;

PlayState *func_80037108(s32 *, s32);

s32 func_800979B8(s16 team, s16 other) {
    if (D_80080CFC[team].score > D_80080CFC[other].score) {
        if (D_8008A5B0 == 1 && func_80037108(&D_8000057C, 1)->down == 0x14) {
            return 6;
        }
        if (D_8008A5B0 == 5) {
            u16 play = func_80037108(&D_8000057C, 1)->play;
            if (play == 0x608) {
                return 5;
            } else if (play == 0xE10) {
                return 5;
            }
        }
    }
    return 0;
}
