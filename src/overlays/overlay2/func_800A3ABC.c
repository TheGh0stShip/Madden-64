#include "types.h"

typedef struct {
    u8 pad00[0x30];
    s32 logos[2];
    u8 pad38[0x18];
    s32 home_art;
    u8 pad54[0x20];
    s32 away_art;
} Game;

typedef struct {
    u8 pad00[0x48];
    s32 x48;
    u8 pad4C[4];
    s32 x50;
} Runtime;

typedef struct {
    u16 players[55];
    u8 name[0x20DE];
} Roster;

typedef struct {
    u16 id;
    u16 model;
} Uniform;

extern Game *D_80087938;
extern u8 D_80071A28[];
extern u16 D_800C391C[];
extern s32 D_800C48B8[];
extern s16 D_800892B4[];
extern Roster D_80080CFC[];
extern Uniform D_800BF050[];
extern char D_800C5CF0[][4][8];

Runtime *func_800DD634(void);
void func_80017B80(s32);
void func_8003A8CC(u16, u16 *);
void func_8003AE80(u16 *, u8 *);
u16 func_8003B7FC(u8 *);
u16 func_8003B02C(u8 *);
u16 func_8003B3A0(u8 *);
u16 func_8003B6AC(u8 *);
void func_800167FC(s16, char *);
void *func_8001B02C(u16);
s16 func_800D3C24(s16, s16);
void func_800D3BD8(void *, s16, s16);
void func_8001EC20(s32, s32);

/* Loads one side's team: art and logo handles, the roster and its name, the
 * four rating strings, then the four uniform models for that side. */
void func_800A3ABC(u16 side, s32 color) {
    Runtime *rt;
    u16 i;
    void *model;
    s32 slot;

    rt = func_800DD634();
    if (side == 0) {
        D_80087938->home_art = D_800C48B8[D_800892B4[0]];
        func_80017B80(D_80087938->home_art);
        rt->x48 = D_80087938->home_art;
        D_80087938->logos[0] = D_800C391C[D_80071A28[D_800892B4[0]]];
    } else {
        D_80087938->away_art = D_800C48B8[D_800892B4[1]];
        func_80017B80(D_80087938->away_art);
        rt->x50 = D_80087938->away_art;
        D_80087938->logos[1] = D_800C391C[D_80071A28[D_800892B4[1]]];
    }
    D_80087938->logos[side] = D_800C391C[D_80071A28[D_800892B4[side]]];
    func_8003A8CC(D_800892B4[side], D_80080CFC[side].players);
    func_8003AE80(D_80080CFC[side].players, D_80080CFC[side].name);
    func_800167FC(func_8003B7FC(D_80080CFC[side].name), D_800C5CF0[side][0]);
    func_800167FC(func_8003B02C(D_80080CFC[side].name), D_800C5CF0[side][1]);
    func_800167FC(func_8003B3A0(D_80080CFC[side].name), D_800C5CF0[side][2]);
    func_800167FC(func_8003B6AC(D_80080CFC[side].name), D_800C5CF0[side][3]);
    for (i = 0; i < 4; i++) {
        slot = side * 4 + i;
        model = func_8001B02C((D_800BF050 + slot)->model);
        func_800D3BD8(model, func_800D3C24(side, i), side);
        func_8001EC20(color, slot + 0x13);
    }
}
