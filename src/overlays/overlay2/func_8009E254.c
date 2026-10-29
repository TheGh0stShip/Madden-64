#include "types.h"

typedef struct {
    u8 pad00[2];
    s8 team;
} Selection;

typedef struct {
    u8 home;
    u8 away;
    u8 pad02[4];
} Matchup;

typedef struct {
    u8 id;
    u8 pad01[12];
} NameRecord;

extern u8 D_80002688[];
extern u8 D_80082DDC[];
extern u8 D_80082E3E;
extern u8 D_80082E40;
extern u8 D_80082E41;
extern u8 D_80082E42;
extern s16 D_80087A68;
extern s16 D_80087A92;
extern s16 D_800892B4;
extern s16 D_800892B6;
extern s16 D_8008A5B0;
extern Selection D_800C4EE8;
extern NameRecord D_800C4EF8[];
extern Matchup D_800C4FBC[];

void func_80024FD8(void);
u16 func_80031A1C(s32);
void func_8003A7DC(u8, u8 *);
void func_800E2190(u8 *, Selection *, s32);

void func_8009E254(s32 index) {
    u8 away;

    D_800C4EE8.team = index;
    func_800E2190(D_80002688, &D_800C4EE8, 1);
    func_80024FD8();
    D_800892B4 = D_800C4EF8[D_800C4FBC[index].home].id;
    away = D_800C4EF8[D_800C4FBC[index].away].id;
    D_800892B6 = away;
    func_8003A7DC(away, D_80082DDC);
    D_80087A68 = 0;
    if (func_80031A1C(5) == 0) {
        D_80087A68 = 4;
    }
    if (func_80031A1C(0xFF) < D_80082E41) {
        D_80087A68 = 1;
    }
    if (func_80031A1C(0xFF) < D_80082E42) {
        D_80087A68 = 3;
    }
    if (D_80087A68 == 0 && func_80031A1C(0xFF) < D_80082E40) {
        D_80087A68 = 2;
    }
    D_8008A5B0 = 5;
    D_80087A92 = D_80082E3E;
}
