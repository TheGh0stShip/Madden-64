#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[4];
    s32 x;
    s32 y;
    u8 pad24[0x1A];
    s16 unk3E;
} Model;

typedef struct {
    u8 pad00[0x24];
    Model *model;
    u8 pad28[4];
    s32 anim;
    u16 timer;
    s16 unk32;
    u8 pad34[0x74];
    s32 unkA8;
    s32 unkAC;
} Object;

typedef struct {
    u8 pad00[0x10];
    Object *object;
    u8 pad14[0x10];
    s32 unk24;
} Controller;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Camera;

extern s32 D_8007A078;
extern u32 D_8007A084;
extern Camera *D_80086178;
extern Object *D_800876CC;
extern s32 D_80087B60;
extern Object *D_8008A054;
extern volatile u16 D_8008A5B4;

u16 func_800B8C90(Controller *, u16);
s16 func_800B9208(Vec3i *);
void func_800B9820(Camera *);
void func_800B98F4(Controller *);
void func_800C0C8C(Object *, s32);
void func_800C16A0(Object *, s16);
void func_800E199C(Object *);

void func_8009FEB4(Controller *ctrl) {
    Object *obj;
    Vec3i delta;

    obj = ctrl->object;
    obj->unkA8 = obj->model->x;
    D_800876CC = obj;
    obj->unkAC = obj->model->y;
    func_800E199C(obj);
    obj->unk32 = 0;
    obj->model->unk3E = 0;
    if (func_800B8C90(ctrl, D_8008A5B4) != 0) {
        D_8007A084 = 0;
        if (obj->model->flags & 0x100) {
            func_800B98F4(ctrl);
        }
        if (obj->anim == 0x41) {
            D_80087B60 = 0x3C;
            func_800C0C8C(obj, 0x3C);
        }
    } else if (ctrl->unk24 == 0 && obj->anim == 0x3C && (++D_8007A084 >= 4 || D_8007A078 == 0)) {
        delta.x = D_80086178->x - obj->model->x;
        delta.y = D_80086178->y - obj->model->y;
        if (delta.x != 0 || delta.y != 0) {
            func_800C16A0(obj, func_800B9208(&delta));
        }
        D_80087B60 = 0x41;
        func_800C0C8C(obj, 0x41);
    }
    obj->model->flags |= 0x20;
    obj->timer -= D_8008A5B4 * 2;
    if ((s16)obj->timer < 0) {
        obj->timer = 0;
    }
    if (obj == D_8008A054) {
        D_80086178->x = obj->model->x;
        D_80086178->y = obj->model->y;
        func_800B9820(D_80086178);
    }
    D_800876CC = NULL;
}
