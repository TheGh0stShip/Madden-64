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
    u8 pad00[0x1E];
    u8 team;
    u8 pad1F[0x24 - 0x1F];
    LinkedState *state;
    u16 flags;
    u8 pad2A[0x8C - 0x2A];
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

extern int abs(int);
extern s16 D_800894FC;
extern s8 D_80086DDC[];
extern s16 D_800886E0;
extern void func_800E1C98(MoveObject *obj);
extern s32 func_800B9208(Delta *delta);
extern s32 func_800C157C(MoveObject *obj);
extern void func_800C058C(MoveObject *obj, s16 heading, s32 arg2, s32 arg3);
extern void func_800C0018(MoveObject *obj, s16 heading, s32 arg2);

s32 func_800E40C4(MoveObject *obj) {
    Delta delta;
    s32 ax;
    s32 ay;
    s32 dist;
    s16 diff;
    s32 heading;
    s16 turn;
    s16 target;

    if (D_800894FC != 0 && D_80086DDC[obj->team] == 1 && (obj->team != D_800886E0 || (obj->flags & 0x80))) {
        func_800E1C98(obj);
        return 1;
    }
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
        obj->state->flags |= 0x200;
        obj->state->x = obj->targetX;
        obj->state->y = obj->targetY;
        obj->state->velX = 0;
        obj->state->velY = 0;
        return 1;
    }
    heading = func_800B9208(&delta);
    if (dist <= 0x1FFFFF) {
        target = heading;
        if ((s16)abs(0x7FF - target) < 0x7F) {
            turn = func_800C157C(obj) & 0xFFF;
            if (turn >= 0x800) {
                turn = 0xFFF - turn;
            }
            if (turn < 0x7F) {
                func_800C058C(obj, target, 0, 0x10000);
                return 0;
            }
        }
    }
    func_800C0018(obj, heading, 0);
    return 0;
}
