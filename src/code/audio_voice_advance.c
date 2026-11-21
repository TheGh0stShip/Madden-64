#include "types.h"

typedef struct {
    u8 pad0000[0x20C4];
    u16 team_id;
    u8 pad20C6[0x214C - 0x20C6];
} Roster;

extern Roster D_80080CFC[];
extern s32 D_80085040[][22];
u8 func_8003C6B4(u16 team, u16 slot);
u8 func_8003C708(u16 team, u16 slot);
void func_800E1CF4(s32 a, s32 b);

void audio_voice_advance(s16 side) {
    s16 first = -1;
    s16 second;
    s16 i;
    u16 team = D_80080CFC[side].team_id;

    for (i = 0; i < 11; i++) {
        if (func_8003C6B4(team, i) == 3 && func_8003C708(team, i) == 0) {
            first = i;
            break;
        }
    }
    second = -1;
    if (first != -1) {
        for (i = 0; i < 11; i++) {
            if (func_8003C6B4(team, i) == 3 && func_8003C708(team, i) == 1) {
                second = i;
                break;
            }
        }
        if (second != -1) {
            func_800E1CF4(D_80085040[side][first], D_80085040[side][second]);
        }
    }
}
