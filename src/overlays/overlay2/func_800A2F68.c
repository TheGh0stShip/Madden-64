#include "types.h"

typedef struct {
    s16 v[8];
} Offsets;

typedef struct {
    s16 kind;
    s16 pad02;
    s32 *list;
    s32 x08;
    s32 pad0C;
    s16 x10;
    s16 pad12;
} Spec;

typedef struct {
    void *sprite;
    u16 x04;
    u8 x06;
    u8 x07;
} Anim;

typedef struct {
    u8 pad00[0x1C];
    s32 x1C;
    s32 x20;
} Sprite;

typedef struct {
    s8 a;
    s8 b;
} Pos;

typedef struct {
    Pos pos;
    u8 pad02[6];
} Slot;

typedef struct {
    u8 pad00[0x4C];
    Slot *slots[8];
    s32 x6C;
    s32 x70;
} Sub;

typedef struct {
    s32 x00;
    s32 pad04;
    s32 x08;
    u8 pad0C[0xC];
    s32 x18;
    s32 x1C;
    s32 x20;
    u8 pad24[0x3C];
    s32 x60;
    s32 x64;
    u8 pad68[0xC];
    Sub sub;
} Obj;

typedef struct {
    u8 pad00[4];
    s16 x04;
    s16 x06;
    s16 x08;
    s16 pad0A;
    s32 pad0C;
    s32 x10;
    u8 pad14[0x14];
    s32 x28;
    s32 x2C;
    s32 x30;
    s32 x34;
    s32 x38;
    s32 x3C;
} Match;

typedef struct {
    u8 x00;
    u8 x01;
} Flags;

typedef struct {
    u8 pad00[4];
    s32 x04;
} Inner;

typedef struct {
    u8 pad00[4];
    Inner *x04;
} Mid;

typedef struct {
    u8 pad00[0xC];
    Mid *x0C;
} Screen;

extern u8 D_80071A28[];
extern u16 D_80084F40;
extern Sprite *D_80086C00[];
extern Match *D_80087938;
extern s16 D_80087A60;
extern u16 D_80087A68;
extern s32 D_80087AA8;
extern s16 D_800892B4[2];
extern s16 D_8008A5B0;
extern Offsets D_8008B904;
extern Pos D_8008B914;
extern s32 D_800BF050[];
extern u8 D_800BF0E1;
extern Flags *D_800BF158;
extern s32 D_800BF160;
extern Flags *D_800BF168;
extern s32 D_800BF190;
extern u16 D_800C391C[];
extern u16 D_800C4EE0;
extern u16 D_800C5098;
extern s8 D_800C509D;
extern Slot D_800C5CF0[];
Sprite *func_8000D740(s32, s32, Spec *);
void func_80016FC4(u16);
u16 func_80016FD4(void);
void func_8001EC20(s32, s32);
void func_8001F25C(s32, s16, s32);
s32 func_8001F848(s32, u16, s32);
void func_8001FA0C(void);
void func_80024694(void);
Match *func_80032E00(s32, s32);
void func_80033308(s32, Match *, s32, s32);
s32 func_80036540(s32);
u8 func_8003C1F0(u8);
void func_80092B98(void);
void func_800A3ABC(s32, s32);
void func_800A3FD4(s32, Match *);
Screen *func_800D5C1C(s32, Obj *, s32 *);
void func_800DD634(void);
void func_800DD694(s32, s32, s32);
void func_800DD7E8(Anim *);
void func_800DFAF8(s32, s32 *, s32);

void func_800A2F68(Obj *arg0) {
    Obj *obj;
    Slot *slot;
    Anim anim;
    Spec spec;
    Offsets offsets;
    Screen *screen;
    Sub *sub;
    Mid *mid;
    s16 i;

    offsets = D_8008B904;
    func_80024694();
    if (D_800892B4[0] >= 125) {
        D_800892B4[0] = 9;
    }
    if (D_800892B4[1] >= 125) {
        D_800892B4[1] = 10;
    }
    if (D_800892B4[0] == 116 || D_800892B4[0] == 117) {
        D_800892B4[0] = 9;
    }
    if (D_800892B4[1] == 116 || D_800892B4[1] == 117) {
        D_800892B4[1] = 10;
    }
    func_800DD634();
    obj = arg0;
    obj->x20 = 0xFA;
    obj->x18 = 0x48;
    D_8008A5B0 = 2;
    obj->x1C = 0;
    obj->x60 = 0;
    obj->x64 = 0;
    switch (D_80087A60) {
        case 180:
            D_800BF0E1 = 0;
            break;
        case 300:
            D_800BF0E1 = 1;
            break;
        case 600:
            D_800BF0E1 = 2;
            break;
        case 900:
            D_800BF0E1 = 3;
            break;
    }
    D_800BF158->x01 = D_80087A68;
    if (D_800C5098 != 0xA55A || D_800C509D == 1) {
        D_800BF168->x01 = 0;
    }
    screen = func_800D5C1C(0x28, obj, &D_800BF190);
    sub = &obj->sub;
    func_800DD694(0x1E, 0x14, 0xA);
    func_800DD694(0x1F, 0x15, 8);
    anim.x06 = 3;
    anim.x04 = 0;
    anim.x07 = 0xA;
    for (i = 0; i < 8; i++) {
        spec.kind = D_800BF050[i];
        spec.list = 0;
        spec.x08 = 0;
        spec.x10 = 1;
        D_80086C00[i] = func_8000D740(D_80087AA8, 1, &spec);
        D_80086C00[i]->x1C = 0;
        D_80086C00[i]->x20 = offsets.v[i] + 0xFA;
        anim.sprite = D_80086C00[i];
        anim.x04 = offsets.v[i];
        func_800DD7E8(&anim);
        sub->slots[i] = slot = &D_800C5CF0[i];
        slot->pos = D_8008B914;
    }
    D_80087938 = func_80032E00(0, 0x88);
    func_80033308(0, D_80087938, 0x88, 0);
    D_80087938->x28 = -1;
    D_80087938->x2C = -1;
    D_80087938->x38 = 0;
    D_80087938->x3C = 0;
    D_80087938->x30 = D_800C391C[D_80071A28[D_800892B4[0]]];
    D_80087938->x34 = D_800C391C[D_80071A28[D_800892B4[1]]];
    D_80087938->x04 = 1;
    D_80087938->x06 = 0;
    D_80087938->x08 = 0;
    D_80087938->x10 = 0;
    mid = screen->x0C;
    func_800A3ABC(0, mid->x04->x04);
    func_800A3ABC(1, mid->x04->x04);
    D_800C4EE0 = func_80016FD4();
    func_80016FC4(D_80084F40);
    func_800A3FD4(0, D_80087938);
    func_800A3FD4(1, D_80087938);
    while (func_80036540(1)) {
        func_80092B98();
    }
    func_800A3FD4(0, D_80087938);
    func_800A3FD4(1, D_80087938);
    if (func_8003C1F0(D_800892B4[1])) {
        func_8001F25C(0, D_800892B4[0], 0);
        func_8001F25C(1, D_800892B4[1], 1);
    } else {
        func_8001F25C(0, D_800892B4[0], 1);
        func_8001F25C(1, D_800892B4[1], 0);
    }
    sub->x6C = func_8001F848(0, D_800892B4[0], 0);
    func_8001EC20(obj->x08, 0x1B);
    sub->x70 = func_8001F848(1, D_800892B4[1], 1);
    func_8001EC20(obj->x08, 0x1C);
    func_8001FA0C();
    if (D_800C5098 != 0xA55A || D_800C509D == 1) {
        func_800DFAF8(obj->x00, &D_800BF160, 0);
    }
}
