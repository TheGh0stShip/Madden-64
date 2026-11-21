#include "types.h"

typedef struct {
    u8 unk_00[0x14];
    s32 unk_14;
} Flags;

typedef struct {
    u8 unk_00[0x1C];
    u8 unk_1C;
    u8 unk_1D[0x3];
    u8 unk_20;
} Player;

typedef struct {
    u8 unk_00[0x24];
    s32 unk_24;
} Obj;

typedef struct {
    u8 unk_00[0x8];
    u16 unk_08;
    u8 unk_0A[0xA];
    u16 unk_14[2][11];
} Setup;

void func_8000BF08(void);
void func_8000CB78(s32, s32, s32);
void func_8000DC18(s32);
void func_80030050(void);
void func_80030110(void);
void func_80030884(void);
s32 func_80030B54(s16);
void func_8003B9C0(u16, u16, u16);
void func_8004583C(void);
void func_800B5028(u16);
void func_800B6378(s32);
void func_800B6610(void);
void func_800B6CC0(void);
void func_800B6D6C(u16, s32);
void func_800B74FC(void);
void global_resource_state_reset(void);
void object_group_reset(void);
extern s16 D_800718E0;
extern s16 D_800718E2;
extern Setup *D_800718E8;
extern s16 D_800718EC;
extern void (*D_80071904[])(void);
extern s32 *D_80071938;
extern s32 *volatile D_8007193C;
extern s32 D_80071940;
extern s8 D_80071948;
extern Player *D_80085040[][22];
extern Obj *D_800850A4;
extern s32 D_80086178;
extern Flags *D_8008794C;
extern u16 D_80087AC4;
extern s16 D_80087B5C;
extern s32 D_80088090;
extern s32 D_8008A058;
extern Flags *D_8008A3E8[];
extern s32 D_8008A5F4[];
extern s16 D_8008AF78;
extern s16 D_8008AF80;

s32 func_800B7680(u16 mode, s32 arg1) {
    u16 done;
    s32 pressed;
    s32 i;
    s32 j;
    s32 k;

    func_800B6CC0();
    func_800B6D6C(mode, arg1);
    D_8007193C = D_80071938;
    D_80071940 = *D_8007193C;
    D_800718E0 = 1;
    D_800718E2 = 1;
    func_8000CB78(D_80088090, 0, 0);
    D_8008A5F4[0] = D_80088090;
    D_8008A058 = 0;
    D_8008AF80 = 2;
    D_80087AC4 = D_800718E8->unk_08;
    done = 0;
    func_800B6378(D_80086178);
    func_800B5028(D_80087AC4 & 0xFFF8);
    pressed = 0;
    func_800B5028(D_80087AC4);
    func_800B74FC();
    for (k = 0; k < D_8008AF78; k++) {
        if (D_8008A3E8[k]) {
            D_8008A3E8[k]->unk_14 |= 1;
        }
    }
    D_8008794C->unk_14 &= ~1;
    func_800B6610();
    D_800718EC = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 11; j++) {
            func_8003B9C0(i, j, D_800718E8->unk_14[i][j]);
            D_80085040[i][j]->unk_20 = D_80085040[i][j]->unk_1C;
        }
    }
    D_8008AF80 = 2;
    D_80071948 = 1;
    while (done == 0) {
        func_80030884();
        j = func_80030B54(D_80087B5C);
        pressed = ~i & j;
        i = j;
        if (D_8008AF80 == 1 || (pressed & 0x1000)) {
            D_8008AF80 = 1;
            done = 1;
        }
        if (done == 0) {
            D_80071904[D_8008AF80]();
        }
        if (arg1 == 0x2D) {
            func_8000DC18(D_800850A4->unk_24);
        }
        func_8000BF08();
        func_8004583C();
        func_80030110();
        func_80030050();
    }
    func_8000BF08();
    func_8000BF08();
    for (k = 0; k < D_8008AF78; k++) {
        if (D_8008A3E8[k]) {
            D_8008A3E8[k]->unk_14 &= ~1;
        }
    }
    global_resource_state_reset();
    object_group_reset();
    D_8008AF80 = 0;
    D_800718E2 = 0;
    if (pressed & 0x1000) {
        return 1;
    }
    return 0;
}
