#include "types.h"

typedef struct {
    s16 count;
    u8 a;
    u8 kind;
} TeamEvent;

typedef struct {
    TeamEvent ev[2131];
} TeamEvents;

typedef struct {
    u8 flags;
    u8 pad01[11];
} ModeInfo;

typedef struct {
    u8 pad00[0x1E];
    u8 team;
} GameState;

extern u16 D_80087768;
extern s32 D_8008776C;
extern s32 D_80087770;
extern u16 D_8008777C;
extern u16 D_8008777E;
extern GameState *D_8008A744;
extern s16 D_80087944;
extern u8 D_80088AF3;
extern u16 D_800880B0;
extern s32 D_800880B4;
extern s32 D_800880B8;
extern u16 D_800880C4;
extern u16 D_800880C6;
extern s32 D_8008B05C;
extern u16 D_8008A740[];
extern ModeInfo D_80069ED6[];
extern u8 D_800892A4[];
extern u8 D_800892A5;
extern u8 D_800892A6;
extern u8 D_800892A7;
extern s16 D_80088AE4;
extern TeamEvents D_80082CA8[];
void func_80025AB8(void);
void func_800AD5D0(s32, s32, s32, s32);
u8 func_800297FC(GameState *);
void play_event_queue_advance(void);
void roster_stat_add(u8, s32, s16);
void game_mode_initialize(void);

void menu_state_render(void) {
    s16 margin;
    s16 points;
    s32 i;
    u8 flags;
    u8 kind;

    D_80087944 = 1;
    D_800880B0 = D_80087768;
    D_800880B4 = D_8008776C;
    D_800880B8 = D_80087770;
    D_800880C4 = D_8008777C;
    D_800880C6 = D_8008777E;
    if (D_8008A744->team == D_80088AF3) {
        margin = D_8008B05C;
        if (margin > 0) {
            margin = -D_8008B05C;
        }
    } else {
        margin = D_8008B05C;
        if (margin < 0) {
            margin = -D_8008B05C;
        }
    }
    flags = D_80069ED6[D_8008A740[0]].flags;
    if (flags & 2) {
        func_80025AB8();
        func_800AD5D0(0, 0, 0, 0);
        D_800892A4[0] = 9;
        D_800892A5 = margin;
        D_800892A6 = func_800297FC(D_8008A744);
        D_800892A7 = D_8008A740[0];
    } else {
        if (flags & 4) {
            for (i = 0; i < D_80082CA8[D_80088AE4].ev[0].count; i++) {
                kind = D_80082CA8[D_80088AE4].ev[i].kind;
                if (kind != 0x24 && kind != 0x25) {
                    if (kind != 0x26) {
                        continue;
                    }
                }
                D_80082CA8[D_80088AE4].ev[i].kind = 0xFF;
            }
        }
        if (D_800892A4[0] != 0) {
            D_800892A4[0] |= 0x80;
            play_event_queue_advance();
        }
        D_800892A4[0] = 9;
        D_800892A5 = margin;
        D_800892A6 = func_800297FC(D_8008A744);
        D_800892A7 = D_8008A740[0];
    }
    roster_stat_add(D_8008A744->team, 8, 1);
    points = D_8008B05C;
    if (points < 0) {
        points = -D_8008B05C;
    }
    if (points <= 0) {
        points = 1;
    }
    roster_stat_add(D_8008A744->team, 9, points);
    game_mode_initialize();
}
