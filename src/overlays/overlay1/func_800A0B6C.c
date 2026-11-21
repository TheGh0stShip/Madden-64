#include "types.h"

typedef struct {
    void (*func)(void);
    u8 unk_04[0xC];
    s16 unk_10;
} Request;

typedef struct {
    u16 unk_00;
    u8 unk_02[0x214A];
} TeamData;

typedef struct {
    u8 unk_00[0x4];
    s8 unk_04;
} Profile;

typedef struct {
    u8 unk_00[0x1C];
    s32 x;
    s32 y;
} Camera;

s32 func_8000C8EC(s32);
void func_8001FA20(void);
void func_80028144(void);
void func_800293CC(void);
void func_80029494(s32);
void func_800297DC(void);
void func_80036D38(void);
Profile *func_80037108(void *, s32);
void func_8003F4E8(void);
void func_80090B14(void);
void func_8009BC40(void);
void func_8009C900(s32, s32);
void func_8009C9E8(void);
void func_8009EDB0(void);
void func_800A3294(void);
void func_800AE8E4(void);
void func_800AE924(Request *);
void grid_callbacks_apply(s32);
void func_800B1E78(void);
void func_8008FC1C(void);
void transition_command_submit(void);
extern u8 D_80000C18[];
extern u32 D_80080C10;
extern TeamData D_80082D94[];
extern s16 D_80082D96;
extern s16 D_80084EE2;
extern s32 D_80084F30[2];
extern s16 D_800857C0;
extern Camera *D_80086178;
extern s16 D_800869D4;
extern s16 D_80086BE2;
extern s16 D_800876DC;
extern s32 D_8008793C;
extern s16 D_80087AC0;
extern s16 D_8008808C;
extern s32 D_80088090;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern u8 D_80088AF3;
extern s16 D_80089320;
extern s32 D_8008A054;
extern s16 D_8008A5B0;
extern u16 D_8008A5B2;

void func_800A0B6C(void) {
    s16 prev;
    s16 home;
    s16 team;
    s16 mode;
    Request req;

    prev = D_800876DC;
    D_8008808C = 0;
    D_80087AC0 = 0;
    func_8003F4E8();
    if (D_8008A5B0 == 1) {
        func_80036D38();
    }
    D_800857C0 = 0;
    if (D_800876DC != 5) {
        if (D_800876DC == 4) {
            if (D_80082D94[D_80088AE4].unk_00 == D_80082D94[D_800886E0].unk_00) {
                D_800876DC = 5;
                D_800869D4 = 1;
            } else {
                D_800876DC = 6;
            }
        } else {
            D_800876DC++;
        }
    } else {
        if (D_8008A5B0 == 1) {
            if (func_80037108(D_80000C18, 1)->unk_04 < 0x11) {
                D_800876DC = 6;
            }
        }
        if (D_8008A5B0 == 2 || D_8008A5B0 == 4) {
            D_800876DC = 6;
        }
    }
    if (D_800876DC != 6) {
    func_8009BC40();
    switch (D_800876DC) {
    case 3:
        D_80080C10 = (D_80080C10 & 0xEFFFFFFF) | 0x80000;
        if (D_80086BE2 == 0) {
            home = 0;
            team = 1;
        } else {
            home = 1;
            team = 0;
        }
        if (team == D_80088AE4) {
            D_800886E0 = home;
            D_80088AE4 = team;
            func_800A3294();
        } else {
            D_800886E0 = home;
            D_80088AE4 = team;
        }
        req.func = func_800B1E78;
        req.unk_10 = 0;
        func_800AE924(&req);
        grid_callbacks_apply(0x63);
        D_80082D96 = 3;
        D_80084EE2 = 3;
        func_80028144();
        func_800293CC();
        D_80088AF3 = D_800886E0;
        func_80090B14();
        D_80084F30[1] = -D_80084F30[1];
        break;
    case 5:
        if (prev != D_800876DC) {
        Request req2;

        D_80080C10 &= 0xEFFFFFFF;
        if (func_8000C8EC(D_80088090)) {
            func_800A3294();
        }
        D_800886E0 = 1;
        D_80088AE4 = 0;
        req2.func = func_8008FC1C;
        req2.unk_10 = 0;
        func_800AE924(&req2);
        D_80089320 = -1;
        if (D_8008A5B0 == 1 && func_80037108(D_80000C18, 1)->unk_04 >= 0x11) {
            mode = 3;
        } else {
            mode = 2;
        }
        D_80082D96 = mode;
        D_80084EE2 = mode;
        break;
        }
    default:
        func_800A3294();
        D_80084F30[0] = -D_80084F30[0];
        D_80084F30[1] = -D_80084F30[1];
        D_8008793C = -D_8008793C;
        break;
    }
    func_8009C9E8();
    func_8009C900(0x19, 2);
    if (prev == 5 && D_800876DC == prev) {
        func_800297DC();
        func_80029494(D_80084F30[1]);
    }
    func_8001FA20();
    if (D_8008A5B2 == 1 && D_8008A054 == 0) {
        if (D_80084F30[0] != D_80086178->x || D_80084F30[1] != D_80086178->y) {
            func_8009EDB0();
        }
    }
    func_800AE8E4();
    } else {
        func_8009C9E8();
        req.func = transition_command_submit;
        req.unk_10 = 0xF;
        func_800AE924(&req);
    }
}
