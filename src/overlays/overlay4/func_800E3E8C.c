#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x1C - 0x18];
    s32 x;
    s32 y;
    u8 pad24[0x2C - 0x24];
    s32 velX;
    s32 velY;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u8 pad28[0x8C - 0x28];
    s32 targetX;
    s32 targetY;
    s32 originX;
    s32 originY;
    s32 heading;
} MoveObject;

typedef struct {
    s32 dx;
    s32 dy;
    s32 pad[2];
} Delta;

extern s16 func_800B9208(Delta *delta);
extern void func_800C0018(MoveObject *obj, s16 heading, s32 arg2);

s32 func_800E3E8C(MoveObject *obj) {
    Delta delta;
    s32 ax;
    s32 ay;
    s32 dist;
    s32 diff;
    s16 heading;

    delta.dx = obj->targetX - obj->state->x;
    delta.dy = obj->targetY - obj->state->y;
    ax = delta.dx;
    if (ax < 0) {
        ax = -ax;
    }
    ay = delta.dy;
    if (ay < 0) {
        ay = -ay;
    }
    if (ax < ay) {
        dist = ay + ax / 2;
    } else {
        dist = ax + ay / 2;
    }
    heading = func_800B9208(&delta);
    diff = (heading - obj->heading) & 0xFFF;
    if (diff >= 0x800) {
        diff = (obj->heading - heading) & 0xFFF;
    }
    if (dist <= 0xBFFFF || diff > 0x400) {
        obj->state->x = obj->targetX;
        obj->state->y = obj->targetY;
        obj->state->velX = 0;
        obj->state->velY = 0;
        obj->state->flags |= 0x200;
        return 1;
    }
    func_800C0018(obj, func_800B9208(&delta), 0);
    return 0;
}
