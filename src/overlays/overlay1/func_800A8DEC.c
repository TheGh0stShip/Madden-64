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
    s16 x;
    s16 y;
    s16 z;
} Vec3s;

typedef struct {
    u8 pad00[0x20];
    s32 unk20;
} Model;

typedef struct {
    u8 pad00[0xC];
    Model *model;
    u8 pad10[4];
    s32 unk14;
    u8 pad18[0x34];
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    u8 pad52[2];
    s16 unk54;
    s16 unk56;
    s16 unk58;
    u8 pad5A[0x1A];
    s16 unk74;
    s16 unk76;
    s16 unk78;
    u8 pad7A[2];
    s16 unk7C;
    s16 unk7E;
    s16 unk80;
} Object;

s32 func_8000C8EC(s32);
void func_800A2E58(Object *, Vec3i *);
void func_800A2EB4(Object *, Vec3s *);

void func_800A8DEC(Object *obj) {
    Vec3i pos;
    Vec3s rot;
    s16 three;

    three = 3;
    if (obj->model != NULL) {
        obj->unk54 = 5;
        obj->unk56 = 5;
        obj->unk58 = 5;
        obj->unk74 = 2;
        obj->unk7E = 4;
        obj->unk80 = 4;
        obj->unk4C = three;
        obj->unk4E = three;
        obj->unk50 = three;
        obj->unk76 = three;
        obj->unk78 = three;
        obj->unk7C = three;
        rot.y = 0;
        rot.x = 0x438;
        if (func_8000C8EC(obj->unk14) != 0) {
            rot.z = 0x7FF;
        } else {
            rot.z = 0;
        }
        pos.x = 0;
        pos.y = obj->model->unk20;
        pos.z = 0xC80000;
        func_800A2E58(obj, &pos);
        func_800A2EB4(obj, &rot);
    }
}
