#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
    s32 z;
} Camera;

typedef struct {
    s16 unk00;
    s16 unk02;
    s16 unk04;
    u8 pad06[6];
    Camera *target;
    Camera *focus;
    s32 owner;
    u8 pad18[0xA8];
} Actor;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

typedef struct {
    s16 model;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    s16 count;
} SpawnParams;

extern s32 D_8007A1AC;
extern Actor *D_8007A1B0;
extern Vec3i D_8007A1B4;
extern Camera *D_80086178;
extern Actor D_80086CE8;
extern s32 D_80088090;
extern s16 D_8008B212;
extern s32 D_800A3164;

s32 func_8000C8A0(s32);
s32 func_8000C8EC(s32);
void func_8000CB78(s32, s32 *, Actor *);
s32 func_8000D740(s32, s32, SpawnParams *);
Actor *func_80032E00(s32, s32);
void func_800A2CD0(Actor *);
void func_800A2DB8(Actor *);
void func_800A3004(Actor *, s32, s32, s32);
void func_800A365C(s32);

void func_800B6000(void) {
    SpawnParams params;

    params.model = 0x688;
    params.unk04 = 0;
    params.unk08 = 0;
    params.count = 8;
    D_8007A1AC = func_8000D740(func_8000C8A0(D_80088090), 1, &params);
    D_8007A1B4.x = D_80086178->x;
    D_8007A1B4.y = D_80086178->y;
    D_8008B212 = 2;
    D_8007A1B4.z = D_80086178->z;
    D_80086178->x = 0xC00000;
    D_80086178->y = 0x15FFF00;
    D_80086178->z = 0x1400000;
    D_8007A1B0 = func_80032E00(0, 0xC0);
    *D_8007A1B0 = D_80086CE8;
    D_8007A1B0->owner = D_80088090;
    D_8007A1B0->unk02 = 0xC;
    D_8007A1B0->unk04 = 0xC;
    D_8007A1B0->unk00 = 0;
    D_8007A1B0->target = D_80086178;
    D_8007A1B0->focus = D_80086178;
    func_8000CB78(D_80088090, &D_800A3164, D_8007A1B0);
    func_800A2DB8(&D_80086CE8);
    func_800A2CD0(D_8007A1B0);
    func_800A365C(2);
    if (func_8000C8EC(D_80088090) == 0) {
        func_800A3004(D_8007A1B0, 0, 0xC, 0xBFF);
    } else {
        func_800A3004(D_8007A1B0, 0, 0xC, 0x3FF);
    }
}
