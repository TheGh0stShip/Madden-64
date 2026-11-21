#include "types.h"

typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    void *unk10;
    s16 unk14;
    s16 unk16;
} SpawnArgs;

typedef struct {
    u8 pad[0x2C];
    u16 unk2C;
    u16 unk2E;
} Sprite;

typedef struct {
    u8 pad[8];
    Sprite *unk8;
} Effect;

typedef struct {
    s16 v[9];
} Offsets;

typedef struct {
    u8 pad[4];
    s8 unk4;
} Settings;

typedef struct {
    u8 pad[3];
    u8 unk3;
    u8 pad4[0xC];
} Stadium;

extern SpawnArgs D_80069BBC;
extern Effect *D_80080A7C;
extern u16 D_800886FC;
extern s32 D_80087A64;
extern s16 D_80087A68;
extern s16 D_8008A5B0;
extern s16 D_80085A40;
extern Stadium D_80073520[];
extern u8 D_80080C90;
extern u16 D_80071B3C[];
extern Offsets D_80000618;
extern Offsets D_8000062C;
extern u8 D_8000057C[];

u16 func_80016FD4(void);
void func_80098DB4(Effect *effect, s32 value);
void func_80098DC0(Effect *effect, s32 value);
void func_80098178(Sprite *sprite);
Effect *func_8000D740(s32 pool, s32 kind, SpawnArgs *args);
u16 func_8003DDA4(void);
Settings *func_80037108(u8 *name, s32 value);
s32 func_80031A1C(s32 range);
void func_8009A50C(Effect *effect, Effect *other);

void func_800944BC(void) {
    Effect *effect;
    Effect *base;
    Settings *settings;
    Offsets dx;
    Offsets dy;
    s32 i;
    u16 first;
    s32 second;

    effect = D_80080A7C;
    D_80069BBC.unk6 = func_80016FD4();
    D_80069BBC.unk6 = D_800886FC;
    func_80098DB4(effect, 0xFA);
    effect->unk8->unk2E -= 0x780;
    func_80098178(effect->unk8);
    D_80069BBC.unk10 = effect;
    D_80069BBC.unkE |= 0x2000;
    effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
    func_80098DB4(effect, 0xFA);
    effect->unk8->unk2E += 0x780;
    func_80098178(effect->unk8);
    D_80069BBC.unk0 = 3;
    D_80069BBC.unk14 = 0x4000;
    D_80069BBC.unk16 = 0x4000;
    D_80069BBC.unk2 = 0xF00;
    D_80069BBC.unk4 = 0xF00;
    D_80069BBC.unkE = 0x1800;
    D_80069BBC.unk10 = 0;
    D_80069BBC.unk8 = D_80069BBC.unkA;
    effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
    func_80098DB4(effect, 0xFA);
    effect->unk8->unk2E += 0x1680;
    func_80098178(effect->unk8);
    dx = D_80000618;
    dy = D_8000062C;
    D_80069BBC.unk10 = effect;
    D_80069BBC.unkE |= 0x2000;
    for (i = 9; i-- != 0;) {
        effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
        func_80098DB4(effect, 0xFA);
        effect->unk8->unk2E += dy.v[i];
        effect->unk8->unk2C += dx.v[i];
        func_80098178(effect->unk8);
    }
    D_80069BBC.unk14 = 0x800;
    D_80069BBC.unk16 = 0x800;
    D_80069BBC.unkE = 0x4000;
    D_80069BBC.unk10 = 0;
    if ((D_80073520[func_8003DDA4()].unk3 & 0x10) && (D_8008A5B0 == 1 || D_80085A40 == 1 || D_8008A5B0 == 2)) {
        settings = func_80037108(D_8000057C, 1);
        if (D_80085A40 == 1 || settings->unk4 < 5 || D_8008A5B0 == 2) {
            D_80069BBC.unk8 = 0xB;
            effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
            func_80098DB4(effect, 0xF9);
            effect->unk8->unk2E += 0xA33;
            effect->unk8->unk2C -= 0x99;
            func_80098178(effect->unk8);
            func_80098DC0(effect, 0xFF);
        }
    }
    if (!(D_80073520[func_8003DDA4()].unk3 & 8)) {
        if (D_80069BBC.unkA == 6) {
            D_80069BBC.unk2 = 0xF00;
            D_80069BBC.unk4 = 0x2400;
            D_80069BBC.unk16 = 0x1000;
            D_80069BBC.unkE = 0xA00;
            D_80069BBC.unk8 = 0xC;
            D_80069BBC.unk8 += func_80031A1C(4);
            effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
            func_80098DB4(effect, 0xF5);
            func_80098DC0(effect, 0x80);
        }
        if (D_80087A68 == 3) {
            D_80069BBC.unk2 = 0xF00;
            D_80069BBC.unk4 = 0x2400;
            D_80069BBC.unk16 = 0x1000;
            D_80069BBC.unkE = 0xA00;
            D_80069BBC.unk8 = 0x10;
            D_80069BBC.unk8 += func_80031A1C(3);
            effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
            func_80098DB4(effect, 0xF5);
            func_80098DC0(effect, 0x80);
        }
    }
    D_80069BBC.unk0 = 1;
    D_80069BBC.unk8 = 0;
    base = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
    D_80069BBC.unk6 = func_80016FD4();
    D_80069BBC.unk0 = 0;
    D_80069BBC.unk2 = 0x300;
    D_80069BBC.unk4 = 0xF00;
    settings = func_80037108(D_8000057C, 1);
    if (D_8008A5B0 == 1 && settings->unk4 == 0x14) {
        first = 0x146;
        second = 0x147;
    } else if (D_8008A5B0 == 1 && settings->unk4 == 0x15) {
        first = 0x145;
        second = 0x149;
    } else {
        second = 0x148;
        first = D_80071B3C[D_80080C90];
    }
    D_80069BBC.unk8 = first;
    D_80069BBC.unkE = 0xC100;
    effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
    func_80098DB4(effect, 0xF8);
    effect->unk8->unk2C += 0x1080;
    func_80098178(effect->unk8);
    func_80098DC0(effect, 0x96);
    D_80069BBC.unk8 = first;
    D_80069BBC.unkE = 0x100;
    effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
    func_80098DB4(effect, 0xF8);
    effect->unk8->unk2C -= 0x1080;
    func_80098178(effect->unk8);
    func_80098DC0(effect, 0x96);
    D_80069BBC.unk8 = second;
    D_80069BBC.unkE = 0x4000;
    D_80069BBC.unk0 = 3;
    D_80069BBC.unk4 = 0x2D9;
    D_80069BBC.unk2 = 0x2D9;
    D_80069BBC.unk16 = 0x800;
    D_80069BBC.unk14 = 0x800;
    effect = func_8000D740(D_80087A64, 0xC, &D_80069BBC);
    func_80098DB4(effect, 0xF6);
    func_80098DC0(effect, 0x78);
    if (second == 0x149) {
        func_80098DC0(effect, 0x64);
    }
    func_8009A50C(effect, base);
    D_80069BBC.unkE = 0;
}
