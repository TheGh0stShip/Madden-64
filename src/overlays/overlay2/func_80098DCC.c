#include "types.h"
typedef struct { s16 kind; s16 pad02; s32 *list; s32 x08; s32 pad0C; s16 x10; s16 pad12; } Spec;
typedef struct { void *sprite; s16 x04; s8 x06; s8 x07; } Anim;
typedef struct { u8 pad00[0x14]; s32 flags; u8 pad18[8]; s32 x20; } Sprite;
typedef struct { s32 x; s32 y; } Pair;
typedef struct { u8 pad00[0x1C]; s32 x; s32 y; u8 pad24[0x24]; s32 x48; } Menu;
typedef struct { u8 head[4]; u8 names[8][13]; u8 used[8]; u8 sel[8]; } Table;
typedef struct {
    u8 pad00[4]; s16 x04; s16 x06; s16 x08; u8 pad0A[6]; s32 x10; u8 pad14[0x14];
    s32 x28; u8 pad2C[4]; s32 x30; u8 pad34[4]; s32 x38; u8 pad3C[0x14]; s32 x50;
} Game;
typedef struct {
    u8 pad00[0x3C]; Sprite *x3C; Sprite *x40; u8 pad44[0x1C];
    s32 x60; s32 pad64; s32 x68; s32 x6C; s32 x70; void *list[0x1A];
} Obj;
extern s32 D_8006BFA0;
extern s32 D_80088090;
extern Pair D_800892E0;
extern void *D_800C0300;
extern s32 D_800C10CC;
extern s32 D_800C10D0;
extern s32 D_800C10D4;
extern s32 D_800C10D8;
extern s32 D_800C10DC;
extern s32 D_800C10E0;
extern s32 D_800C10E4;
extern s32 D_800C10E8;
extern Table D_800C4AD0;
extern u16 D_80084F40;
extern Game *D_80087938;
extern u8 D_80071A28[];
extern u16 D_800C391C[];
extern s32 D_800C48B8[];
typedef struct { s16 team; } Current;
extern Current D_800892B4;
Menu *func_800DD634(void);
s32 func_8000C8A0(s32);
Sprite *func_8000D740(s32, s32, Spec *);
void func_800DD82C(Anim *);
void func_80016FE4(s32);
u16 func_80016FD4(void);
void func_80016FC4(u16);
Game *func_80032E00(s32, s32);
void func_80033308(s32, Game *, s32, s32);
void func_80017B80(s32);
void func_800A3FD4(s32, Game *);

void func_80098DCC(Obj *obj) {
    Spec spec;
    Anim anim;
    Menu *menu;
    Sprite *sprite;
    Sprite *other;
    u32 i;

    menu = func_800DD634();
    obj->list[0] = (void *)0x19;
    for (i = 1; i < 0x1A; i++) {
        obj->list[i] = &D_8006BFA0;
    }
    obj->list[1] = &D_800C10CC;
    obj->list[2] = &D_800C10D0;
    obj->list[3] = &D_800C10D4;
    obj->list[4] = &D_800C10D8;
    obj->list[5] = &D_800C10DC;
    obj->list[6] = &D_800C10E0;
    obj->list[7] = &D_800C10E4;
    obj->list[8] = &D_800C10E8;
    for (i = 0; i < 8; i++) {
        obj->list[i + 9] = D_800C4AD0.names[i];
        obj->list[i + 17] = &D_8006BFA0;
        D_800C4AD0.sel[i] = 0xFF;
    }
    D_800C4AD0.sel[0] = 0x7D;
    obj->list[25] = D_800C4AD0.names;
    obj->list[17] = D_800C0300;
    spec.kind = 0x640;
    spec.x10 = 6;
    spec.list = (s32 *)obj->list;
    spec.x08 = 0;
    sprite = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    sprite->x20 = 0xF0;
    obj->x3C = sprite;
    obj->x60 = 0;
    spec.kind = 0x648;
    other = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    other->flags &= ~1;
    obj->x40 = other;
    anim.x06 = 3;
    anim.x04 = 0;
    anim.x07 = 0xA;
    anim.sprite = sprite;
    func_800DD82C(&anim);
    obj->x68 = 0;
    obj->x70 = 1;
    obj->x6C = func_80016FD4();
    func_80016FC4(D_80084F40);
    D_80087938 = func_80032E00(0, 0x88);
    func_80033308(0, D_80087938, 0x88, 0);
    D_80087938->x28 = -1;
    D_80087938->x38 = 0;
    D_80087938->x04 = 4;
    D_80087938->x06 = 0;
    D_80087938->x08 = 0;
    D_80087938->x10 = 0;
    D_80087938->x30 = D_800C391C[D_80071A28[D_800C4AD0.sel[0]]];
    D_80087938->x50 = D_800C48B8[D_800C4AD0.sel[0]];
    D_800892B4.team = D_800C4AD0.sel[0];
    func_80017B80(D_80087938->x50);
    menu->x48 = D_80087938->x50;
    func_800A3FD4(0, D_80087938);
    menu->x = D_800892E0.x;
    menu->y = D_800892E0.y;
    func_80016FE4(D_800892E0.x);
    func_80016FE4(D_800892E0.y);
}
