#include "types.h"

typedef struct {
    u8 pad00[4];
    u16 unk04;
} Model;

typedef struct Object {
    s16 unk00;
    s16 state;
    u8 pad04[2];
    s16 unk06;
    u8 pad08[0xC];
    Model *model;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    u8 pad28[4];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[0x24];
    u16 unk5C;
    u16 unk5E;
    u16 unk60;
    u8 pad62[2];
    u16 unk64;
    u16 unk66;
    u16 unk68;
    u8 pad6A[0x1A];
    u16 flags;
} Object;

extern u16 D_8006A7C0[];
extern void (*D_8006A700[])(Object *);
extern void (*D_8006A740[])(Object *);

void func_8000B7A4(Model *, u16);

void func_800A7634(Object *obj, s16 arg1, s16 arg2, s16 arg3) {
    Model *model;
    u16 id;

    obj->unk00 = arg1;
    obj->state = arg2;
    obj->unk06 = arg3;
    obj->flags &= 0xFFEF;
    model = obj->model;
    if (model != 0) {
        id = D_8006A7C0[obj->state];
        if (model->unk04 != id) {
            func_8000B7A4(model, id);
        }
    }
    D_8006A700[obj->state](obj);
    D_8006A740[obj->state](obj);
    obj->unk1C = obj->unk2C;
    obj->unk20 = obj->unk30;
    obj->unk24 = obj->unk34;
    obj->unk5C = obj->unk64;
    obj->unk5E = obj->unk66;
    obj->unk60 = obj->unk68;
    obj->flags &= 0xFFD6;
}
