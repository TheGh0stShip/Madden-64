#include "types.h"

typedef struct {
    u8 *play;
    s16 unk_04;
    u8 pad06[0x214C - 6];
} Slot;

typedef struct {
    s32 unk_00;
    u8 *entries[1];
} Table;

extern s16 D_8006B7AA[];
extern s16 D_8006B7BC[];
extern Slot D_80082DBC[];
extern s16 D_80086BE6;
extern s16 D_80086C8C;
extern s16 D_8008791C;
extern s16 D_80087946;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern Table *D_800895DC;

s32 func_800BEE28(void);
void func_80092830(s16);

/* recipe: --symbol=func_800BEE28:0x800BEE28 --symbol=func_80092830:0x80092830 (catalogue func_800C354C / func_80096F54) */
/* Re-selects a team's play after the play-call screen changed it, skipping the reserved 0x12-0x19 plays, and refreshes its slot. */
void func_80096D88(s16 team) {
    s16 play;

    if (team == D_80088AE4) {
        if (D_8006B7BC[0] != D_80086C8C || D_8006B7AA[0] != D_80087946) {
            goto changed;
        }
    }
    if (team != D_800886E0) {
        return;
    }
    if (D_8006B7BC[1] == D_80086BE6 && D_8006B7AA[1] == D_8008791C) {
        return;
    }
changed:
    func_800BEE28();
    if (D_80089320 == -1) {
        return;
    }
    if (D_80088AE4 == team) {
        play = D_80087946;
        if (play < 0x1A) {
            if (play >= 0x12) {
                return;
            }
        }
        D_8006B7AA[0] = play;
        D_80082DBC[team].play = D_800895DC->entries[play & 0x1FFF];
        D_8006B7BC[0] = D_80086C8C;
        func_80092830(team);
    } else {
        D_8006B7AA[1] = D_8008791C;
        D_80082DBC[team].play = D_800895DC->entries[D_8006B7AA[1] & 0x1FFF];
        D_8006B7BC[1] = D_80086BE6;
        func_80092830(team);
    }
}
