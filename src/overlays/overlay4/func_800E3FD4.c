#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x1C - 0x18];
    s32 x;
    s32 y;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u8 pad28[0x64 - 0x28];
    u8 cmd[4];
    u8 pad68[0x8C - 0x68];
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

s32 func_800E3FD4(MoveObject *obj) {
    Delta delta;

    obj->targetX = obj->cmd[3] << 18;
    if (obj->targetX & 0x2000000) {
        obj->targetX |= 0xFC000000;
    }
    obj->targetY = ((obj->cmd[1] << 8) + obj->cmd[2]) << 16;
    if (obj->targetY > 0x3AFFFFF) {
        obj->targetY = 0x3B00000;
    }
    if (obj->targetY <= -0x3B00000) {
        obj->targetY = -0x3B00000;
    }
    obj->state->flags &= ~0x200;
    obj->originX = obj->state->x;
    obj->originY = obj->state->y;
    delta.dx = obj->targetX - obj->originX;
    delta.dy = obj->targetY - obj->originY;
    obj->heading = func_800B9208(&delta);
    return 0;
}
