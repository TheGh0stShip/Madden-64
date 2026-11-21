#include "types.h"

typedef struct {
    u8 *info;
    u8 pad04[0x2148];
} TeamData;

extern s16 D_8006B7AA;
extern s32 D_80080C10;
extern TeamData D_80082DBC[];
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_80089320;

void roster_stat_add(u16, s32, s32);

void frame_resource_prepare(s32 mode, s32 flags) {
    s32 team;
    s32 kind;

    if (D_80080C10 & 1) {
        team = D_800886E0;
    } else {
        team = D_80088AE4;
    }
    kind = *D_80082DBC[team].info & 0x60;
    if (kind == 0x20) {
        roster_stat_add(team, 0x16, 1);
    } else if (kind == 0x40) {
        roster_stat_add(team, 0x15, 1);
    }
    if (D_80089320 == 3) {
        roster_stat_add(team, 4, 1);
        if (!(D_80080C10 & 1)) {
            if (!(flags & 4)) {
                if ((u16)mode < 2) {
                    roster_stat_add(team, 5, 1);
                }
            }
        }
    } else if (D_80089320 == 4) {
        if (D_8006B7AA != 0x15 && D_8006B7AA != 0x16 && D_8006B7AA != 0x17 && D_8006B7AA != 0x12) {
            roster_stat_add(team, 6, 1);
            if (!(D_80080C10 & 1)) {
                if (!(flags & 4)) {
                    if ((u16)mode < 2) {
                        roster_stat_add(team, 7, 1);
                    }
                }
            }
        }
    }
}
