#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    u8 role;
    u8 pad1D[7];
    s32 model;
} Member;

typedef struct {
    Member *members[22];
} Group;

typedef struct {
    u8 kind;
    u8 value;
    u8 pad02[6];
} Reply;

extern u16 D_8006B7AC;
extern s32 D_80074830;
extern s32 D_80080C2C;
extern s32 D_80084F34;
extern Group D_80085040[];
extern s16 D_800869D0[];
extern s16 D_80086CF2;
extern u8 D_80086DDC[];
extern s16 D_800876F6;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern s16 D_80089320;
extern s16 D_80089354;
extern s8 D_8008951A;
extern u8 D_8008AFC6;

void func_80038150(u16);
void func_800416A4(s32);
void func_80041BDC(s32, s32);
void func_800A365C(s32);
u8 func_800A6580(void);
void func_800B96C0(s32, s32 *);
void func_800BCF98(void);
void func_800BDB28(s32);
void func_800D6118(void);
s16 func_800E1DB8(u16, s32, s32, s32, Reply *);
void func_800E1EF8(s16);

void func_80096550(s32 team) {
    s32 i;
    s32 role;
    Member *member;
    Reply reply;

    if (team == D_80088AE4) {
        if (D_80089320 != -1) {
            func_800416A4(1);
            if (D_80084F34 > 0x2C00000 && (D_80089320 != 0) & (D_80089320 != 4)) {
                func_80041BDC(0x1C, 0x19);
            }
            if (D_80084F34 < (s32)0xFD400000 && (D_80089320 != 0) & (D_80089320 != 4)) {
                func_80041BDC(0x1D, 0x19);
            }
            if (D_80089320 != -1) {
                for (i = 0; i < 11; i++) {
                    member = (D_80085040 + D_80088AE4)->members[i];
                    role = member->role;
                    if (role < 10) {
                        if (role >= 5) {
                            func_800B96C0(member->model, &D_80074830);
                        }
                    }
                }
            }
        }
        D_80089354 = 0;
        D_800876F6 = 0;
        D_80080C2C = 0;
        if (D_80086CF2 != 3) {
            func_800A365C(0xC);
        }
    }
    D_800869D0[team] = 0;
    D_80086DDC[team] = 1;
    func_80038150(team);
    func_800E1EF8(team);
    if (D_8008AFC6 == 1 && team == D_80088AE4 && func_800A6580() == 7) {
        D_8008951A = 0;
        if (func_800E1DB8(D_80088AE4, 0, 0xB, 0, &reply) != -1) {
            D_8008951A = reply.value & 0x7F;
        }
    }
    func_800BDB28(team);
    func_800BCF98();
    if (team == D_800886E0 && (D_8006B7AC & 0x2000)) {
        func_800D6118();
    }
}
