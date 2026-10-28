#include "types.h"

typedef struct {
    u8 pad00[8];
    s32 pos[3];
    u8 pad14[4];
    u16 rot[3];
    u8 pad1E[4];
    u16 time;
} Key;

typedef struct {
    u16 rot[3];
    u8 pad06[2];
    s32 pos[3];
} Pose;

extern s32 D_8008A5F4;

void func_8000C9AC(s32, u16 *);
void func_8000CA20(s32, s32 *);
u16 func_800B73A4(s16, s16, u16, u16);
s32 func_800B7420(s32, s32, u16, u16);
u16 func_800B79F0(s16, s16);

void func_800BB920(s16 time, Key *a, Key *b) {
    Pose pose;
    u16 span;
    u16 t;
    s32 *model;

    if ((u16)time == a->time) {
        pose.rot[0] = a->rot[0];
        pose.rot[1] = a->rot[1];
        pose.rot[2] = a->rot[2];
        pose.pos[0] = a->pos[0];
        pose.pos[1] = a->pos[1];
        pose.pos[2] = a->pos[2];
    } else if ((u16)time == b->time) {
        pose.rot[0] = b->rot[0];
        pose.rot[1] = b->rot[1];
        pose.rot[2] = b->rot[2];
        pose.pos[0] = b->pos[0];
        pose.pos[1] = b->pos[1];
        pose.pos[2] = b->pos[2];
    } else {
        span = func_800B79F0(a->time, b->time);
        t = func_800B79F0(a->time, time);
        pose.rot[0] = func_800B73A4(a->rot[0], b->rot[0], t, span);
        pose.rot[1] = func_800B73A4(a->rot[1], b->rot[1], t, span);
        pose.rot[2] = func_800B73A4(a->rot[2], b->rot[2], t, span);
        pose.pos[0] = func_800B7420(a->pos[0], b->pos[0], t, span);
        pose.pos[1] = func_800B7420(a->pos[1], b->pos[1], t, span);
        pose.pos[2] = func_800B7420(a->pos[2], b->pos[2], t, span);
    }
    model = &D_8008A5F4;
    if (*model != 0) {
        func_8000C9AC(*model, pose.rot);
        func_8000CA20(*model, pose.pos);
    }
}
