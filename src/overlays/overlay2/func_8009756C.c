#include "types.h"
typedef struct { s16 kind; s16 pad02; s32 *list; s32 x08; s32 pad0C; s16 x10; s16 pad12; } Spec;
typedef struct { void *sprite; s16 x04; s8 x06; s8 x07; } Anim;
typedef struct { u8 pad00[0x14]; s32 flags; u8 pad18[8]; s32 x20; } Sprite;
typedef struct { u8 data[13]; } Name;
typedef struct { s32 x; s32 y; } Pair;
typedef struct { u8 pad00[0x1C]; s32 x; s32 y; } Menu;
typedef struct {
    u8 pad00[0x3C]; Sprite *x3C; Sprite *x40; Sprite *x44; u8 pad48[0x18];
    s32 x60; s32 x64; s32 x68; s32 pad6C; s32 x70; void *list[0x19];
} Obj;
extern s32 D_8006BFA0;
extern s32 D_80088090;
extern Pair D_800892E0;
extern s32 D_800C10C0;
extern s32 D_800C10C4;
extern s32 D_800C10CC;
extern s32 D_800C10D0;
extern s32 D_800C10D4;
extern s32 D_800C10D8;
extern s32 D_800C10DC;
extern s32 D_800C10E0;
extern s32 D_800C10E4;
extern s32 D_800C10E8;
extern Name D_800C4AD4[];
extern s8 D_800C4B3C[];
Menu *func_800DD634(void);
s32 func_8000C8A0(s32);
Sprite *func_8000D740(s32, s32, Spec *);
void func_800DD82C(Anim *);
void func_80016FE4(s32);

void func_8009756C(Obj *obj) {
    Spec spec;
    Anim anim;
    Menu *menu;
    Sprite *sprite;
    Sprite *other;
    Sprite *third;
    u32 i;

    menu = func_800DD634();
    obj->list[0] = (void *)0x18;
    for (i = 1; i < 0x19; i++) {
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
        obj->list[i + 9] = &D_800C4AD4[i];
        if (D_800C4B3C[i] == 0) {
            obj->list[i + 17] = &D_800C10C0;
        } else {
            obj->list[i + 17] = &D_800C10C4;
        }
    }
    spec.kind = 0x610;
    spec.x10 = 6;
    spec.list = (s32 *)obj->list;
    spec.x08 = 0;
    sprite = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    sprite->x20 = 0xF0;
    obj->x3C = sprite;
    obj->x60 = 0;
    obj->x64 = 0;
    spec.kind = 0x618;
    third = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    third->flags &= ~1;
    obj->x40 = third;
    spec.kind = 0x6B8;
    spec.x10 = 5;
    other = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    other->flags &= ~1;
    obj->x44 = other;
    anim.x06 = 3;
    anim.x04 = 0;
    anim.x07 = 0xA;
    anim.sprite = sprite;
    func_800DD82C(&anim);
    obj->x68 = 0;
    obj->x70 = 1;
    menu->x = D_800892E0.x;
    menu->y = D_800892E0.y;
    func_80016FE4(D_800892E0.x);
    func_80016FE4(D_800892E0.y);
}
