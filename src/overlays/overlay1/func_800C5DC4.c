#include "types.h"

typedef struct {
    s32 unk00;
    u16 angle;
} Pose;

typedef struct {
    u8 pad00[0x12];
    s16 angle;
} Transform;

typedef struct {
    u8 pad00[8];
    Transform *transform;
    u8 pad0C[0x48];
    u16 mode;
} Model;

typedef struct {
    u8 pad00[0x24];
    Model *model;
} Object;

extern s32 D_80088090;

s32 func_8000C8EC(s32);
void func_8000EC6C(Model *, Pose *);
void func_8000EC8C(Model *, Pose *);

void func_800C5DC4(Object *obj, s32 angle) {
    Model *model = obj->model;
    Pose pose;

    if (model->mode == 6) {
        model->transform->angle = angle & 0xFFF;
    } else if (model->mode == 7) {
        model->transform->angle = angle & 0xFFF;
    } else if (model->mode == 8) {
        func_8000EC6C(model, &pose);
        pose.angle = (angle - 0x400) & 0xFFF;
        if (func_8000C8EC(D_80088090) != 0) {
            pose.angle ^= 0x800;
        }
        func_8000EC8C(obj->model, &pose);
    }
}
