#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    s32 x, y, z;
} Vec3;

typedef struct {
    s16 x, y, z;
} Vec3s;

typedef struct {
    u8 pad00[4];
    u16 modelId;
} Model;

typedef struct Object {
    s16 type;
    s16 state;
    u8 pad04[2];
    s16 substate;
    u8 pad08[0xC];
    Model *model;
    u8 pad18[4];
    Vec3 pos;
    u8 pad28[0x14];
    Vec3 vel;
    u8 pad48[4];
    Vec3s scaleA;
    u8 pad52[2];
    Vec3s scaleB;
    u8 pad5A[2];
    Vec3s rot;
    u8 pad62[0xA];
    Vec3s angVel;
    u8 pad72[2];
    Vec3s scaleC;
    u8 pad7A[2];
    Vec3s scaleD;
    u8 pad82[2];
    u16 flags;
} Object;

extern void (*D_8006A700[])(Object *);
extern void (*D_8006A740[])(Object *);
extern u16 D_8006A7C0[];

void func_8000B7A4(Model *, u16);

void func_800A7728(Object *obj, s16 type, s16 state, s16 substate) {
    Vec3 pos;
    Vec3s rot;

    obj->type = type;
    obj->state = state;
    obj->substate = substate;
    obj->flags &= 0xFFCE;
    pos.x = obj->pos.x;
    pos.y = obj->pos.y;
    pos.z = obj->pos.z;
    rot.x = obj->rot.x;
    rot.y = obj->rot.y;
    rot.z = obj->rot.z;
    obj->vel.x = 0;
    obj->vel.y = 0;
    obj->vel.z = 0;
    obj->angVel.x = 0;
    obj->angVel.y = 0;
    obj->angVel.z = 0;
    if (obj->model != NULL && obj->model->modelId != D_8006A7C0[obj->state]) {
        func_8000B7A4(obj->model, D_8006A7C0[obj->state]);
    }
    D_8006A700[obj->state](obj);
    D_8006A740[obj->state](obj);
    obj->pos.x = pos.x;
    obj->pos.y = pos.y;
    obj->pos.z = pos.z;
    obj->rot.x = rot.x;
    obj->rot.y = rot.y;
    obj->rot.z = rot.z;
    obj->scaleA.x = 4;
    obj->scaleA.y = 4;
    obj->scaleA.z = 4;
    obj->scaleB.x = 6;
    obj->scaleB.y = 6;
    obj->scaleB.z = 6;
    obj->scaleC.x = 4;
    obj->scaleC.y = 4;
    obj->scaleC.z = 4;
    obj->scaleD.x = 6;
    obj->scaleD.y = 6;
    obj->scaleD.z = 6;
    obj->flags |= 0x29;
}
