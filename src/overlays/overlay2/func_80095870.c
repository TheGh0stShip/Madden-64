#include "types.h"

typedef struct {
    u8 pad00[0xE];
    u8 unk_0E;
    u8 pad0F[0x28 - 0xF];
} TeamPlayer;

typedef struct {
    u8 id;
    u8 pad01[0x6C - 0x1];
    u16 roster[0x37];
    TeamPlayer players[0x37];
    u8 pad972[0x214C - 0x972];
} Team;

extern Team D_80080C90[2];
extern u8 D_800C3990;

u16 func_800D20A0(TeamPlayer *, u16, u8);

u8 func_80095870(s32 arg0) {
    s32 team;
    s32 sum;
    s32 count;
    s32 i;

    sum = 0;
    count = 0;
    i = 0;
    team = arg0 == D_80080C90[1].id;
    for (; i < 0x37; i++) {
        if (D_80080C90[team].roster[i] != 0xFFFF) {
            switch (D_80080C90[team].players[i].unk_0E) {
                case 1:
                    sum += func_800D20A0(D_80080C90[team].players, i, 0xFF) * 3;
                    count += 3;
                    break;
                case 2:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                    sum += func_800D20A0(D_80080C90[team].players, i, 0xFF);
                    count += 1;
                    break;
            }
            if (count >= 9) {
                break;
            }
        }
    }
    if (sum / count >= 0x104) {
        return D_800C3990;
    }
    return 0;
}
