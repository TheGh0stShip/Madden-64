#include "types.h"

typedef struct {
    u8 pad00[0x12];
    u16 heading;
} Model;

typedef struct {
    u8 pad00[0x8];
    Model *model;
    u8 pad0C[0x14 - 0xC];
    s32 flags;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u8 pad28[0x2C - 0x28];
    s32 mode;
} Actor;

extern s32 D_800717F0;
extern s32 D_80087910;
extern Actor *D_8008A058;
extern s32 D_80069A48[];
extern u16 D_8007A1D8;
extern s32 D_800861B8[];
extern s32 D_800717F4;
extern Actor *func_800301E0(s32 task, s32 arg1);
extern void func_800344E8(LinkedState *state, s32 arg1, s32 mode, s32 arg3);
extern void func_8002FF70(s32 task);
extern void func_80032F3C(s32 arg0, s32 arg1);

void func_800E259C(void) {
    Actor *actor;

    D_800717F0 = 0xFE2C0000;
    actor = func_800301E0(D_80087910, 0);
    actor->mode = 0x2B;
    if (actor == D_8008A058) {
        actor->mode = 0x2F0029;
    } else {
        actor->mode = 0x2E0003;
    }
    actor->state->flags &= 0xFFC0FFFF;
    func_800344E8(actor->state, D_80069A48[0], actor->mode, 0);
    actor->state->model->heading = (actor->state->model->heading + D_8007A1D8) & 0xFFF;
    actor->state->flags &= 0xFFFEFFFF;
    if (D_80087910 != 0) {
        func_8002FF70(D_80087910);
        D_80087910 = 0;
    }
    func_80032F3C(0, D_800861B8[0]);
    D_800861B8[0] = 0;
    D_800717F4 = 0;
    actor->state->flags |= 0x10;
}
