#include "types.h"

typedef struct {
    s32 x00;
    s16 x04;
    s16 x06;
    s16 x08;
    s32 x0C;
    s32 x10;
    s32 x14;
    s32 x18;
    void *x1C;
    u16 x20;
} Spec;

typedef struct { u8 pad00[0x14]; s32 flags; } Sprite;

typedef struct {
    u8 pad00[8];
    Sprite *x08;
    u8 pad0C[4];
    Sprite *x10;
    u8 pad14[4];
    s32 x18;
    s32 x1C;
    s32 x20;
    u8 pad24[0x3C];
    s32 x60;
    s32 x64;
    s32 x68;
    s32 x6C;
    u8 pad70[0x30];
    s32 xA0;
} Obj;

extern s32 D_80071310;
extern s16 D_80073444;
extern s16 D_80087A68;
extern s32 D_80088090;
extern u16 D_800895D2;
extern s16 D_8008A5B0;
extern u8 D_8008B8E8[];
extern void *D_800BEFA4;
extern void *D_800BEFB8;
extern void *D_800BEFC4;
extern void *D_800BEFC8;
extern u8 D_800BF038[];
extern s8 D_800BF043;
extern s8 D_800BF044;
extern void **D_800BF048;
extern void **D_800BF04C;
extern u8 D_800C03F8[];
extern u8 D_800C1240[];
extern u8 D_800C125C[];
extern u8 D_800C23BC[];
extern u8 D_800C23CC[];
extern u8 D_800C23DC[];
extern u16 D_800C4AD0;
extern u16 D_800C4EE8;
extern u16 D_800C5098;
extern s16 D_800C5C36;
extern s16 D_800C5C3A;
extern s8 D_800C5D44;

void func_8009DF00(void);
void func_800A28F8(void);
void func_800A2BD8(void);
void func_80094114(void);
u8 func_8003E2C0(u8 *, s32);
void func_8003A600(s32, s32);
void func_800D5C1C(s32, Obj *, u8 *);
void func_800E08A4(s32);
s32 func_8000C8A0(s32);
s32 func_8000D740(s32, s32, Spec *);
void func_80016FE4(s32);
void func_80017CC8(s32, s32);
void func_80092B98(void);

void func_800A2268(Obj *obj) {
    Spec spec;
    u8 *text;
    s32 size;
    s32 sprite;
    u8 result;

    text = 0;
    func_80094114();
    result = func_8003E2C0(D_800C03F8, 0);
    if (result == 1) {
        D_80071310 = result;
    }
    D_800C5C3A = 0;
    D_80087A68 = 0;
    D_800C5C36 = 0;
    if (D_80073444 == 0) {
        func_8003A600(0, 0);
        if (D_800C5098 == 0xA55A || D_800C4EE8 == 0x5AA5) {
            func_8003A600(1, 1);
        }
    }
    obj->x18 = 0x18;
    obj->x1C = 0;
    if (D_8008A5B0 == 0) {
        obj->x20 = 0;
    } else {
        obj->x20 = 0xC8;
    }
    if (D_800C5098 == 0xA55A) {
        D_800BEFC4 = func_800A28F8;
        text = D_800C23BC;
    }
    if (D_800C4EE8 == 0x5AA5) {
        D_800BEFC4 = func_8009DF00;
        text = D_800C23CC;
    }
    if (D_800C4AD0 == 0xA5A5) {
        D_800BEFC4 = func_800A2BD8;
        text = D_800C23DC;
    }
    size = 0x20;
    if (text != 0) {
        D_800BF04C = &D_800BEFB8;
        D_800BF048 = &D_800BEFB8;
        D_800BF043 = D_800BF044 = 8;
    } else {
        size = 0x10;
        D_800BF04C = &D_800BEFC8;
        D_800BF048 = &D_800BEFC8;
        D_800BF043 = D_800BF044 = 7;
    }
    D_800BEFB8 = text;
    func_800D5C1C(size, obj, D_800BF038);
    obj->x60 = 0;
    obj->x6C = 0;
    if (D_8008A5B0 == 0 || D_8008A5B0 == 4) {
        func_800E08A4(0);
        obj->x08->flags &= ~1;
        obj->x10->flags &= ~1;
        spec.x0C = 4;
        spec.x06 = 0x74;
        spec.x08 = 0xC8;
        spec.x04 = 0;
        spec.x10 = 0;
        spec.x1C = D_8008B8E8;
        spec.x20 = D_800895D2;
        sprite = func_8000D740(func_8000C8A0(D_80088090), 0, &spec);
        func_80016FE4(sprite);
        func_80017CC8(sprite, 0x60);
        obj->xA0 = sprite;
        obj->x64 = 0;
        obj->x68 = 0;
        D_800BEFA4 = D_800C1240;
    } else {
        obj->x64 = 2;
        obj->xA0 = 0;
        D_800BEFA4 = D_800C125C;
    }
    D_800C5D44 = 0;
    func_80092B98();
    func_80092B98();
    func_80092B98();
}
