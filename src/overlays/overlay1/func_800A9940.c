#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    s32 w;
} CamVec;

typedef struct {
    s16 x;
    s16 y;
    s16 z;
    s16 pad;
} CamRot;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
    s32 z;
} CamTarget;

typedef struct {
    u8 pad00[6];
    s16 unk_06;
    u8 pad08[4];
    CamTarget *target;
    u8 pad10[0xC];
    CamVec pos;
    CamVec next;
    u8 pad3C[0x10];
    CamRot speedA;
    CamRot speedB;
    CamRot rot;
    CamRot rotCopy;
    u8 pad6C[8];
    CamRot accelA;
    CamRot accelB;
    u16 flags;
    u8 pad86[2];
    s32 unk_88;
    s32 unk_8C;
    u8 pad90[8];
    s32 unk_98;
    s32 unk_9C;
    s32 unk_A0;
    s32 unk_A4;
    CamRot prev;
} Camera;

void func_800A2DFC(Camera *cam, void *out);
void func_800A2E24(Camera *cam, CamRot *out);
void func_800A5AA8(Camera *cam);
s16 func_800B9208(s32 *delta);
s32 func_800A69D8(s32 dx, s32 dy);

void func_800A9940(Camera *cam) {
    CamVec pos;
    s32 d[4];
    CamRot rot;
    CamTarget *target;
    s32 *axis;
    s32 diff;
    s32 from;
    s32 limit;

    if (cam->flags & 0x100) {
        func_800A2DFC(cam, &cam->pos);
        func_800A2E24(cam, &cam->rot);
        cam->speedA.x = 0x20;
        cam->speedA.y = 0x20;
        cam->speedA.z = 0x20;
        cam->speedB.x = 0x20;
        cam->speedB.y = 0x20;
        cam->speedB.z = 0x20;
        cam->accelA.x = 0x20;
        cam->accelA.y = 0x20;
        cam->accelA.z = 0x20;
        cam->accelB.x = 0x20;
        cam->accelB.y = 0x20;
        cam->accelB.z = 0x20;
        return;
    }
    if (cam->target == 0) {
        return;
    }
    if (!(cam->flags & 0x80)) {
        cam->speedA.x = 0;
        cam->speedA.y = 0;
        cam->speedA.z = 0;
        cam->speedB.x = 0;
        cam->speedB.y = 0;
        cam->speedB.z = 0;
        cam->accelA.x = 0;
        cam->accelA.y = 0;
        cam->accelA.z = 0;
        cam->accelB.x = 0;
        cam->accelB.y = 0;
        cam->accelB.z = 0;
        cam->flags |= 0x80;
        func_800A5AA8(cam);
        func_800A2DFC(cam, &cam->unk_88);
        d[0] = cam->target->x - cam->pos.x;
        d[1] = cam->target->y - cam->pos.y;
        rot.z = func_800B9208(d);
        rot.y = 0;
        d[0] = func_800A69D8((cam->target->x - cam->pos.x) >> 16, (cam->target->y - cam->pos.y) >> 16) << 16;
        d[1] = cam->target->z - cam->pos.z;
        rot.x = func_800B9208(d);
        if ((cam->flags & 0x200) && rot.x < (s16)cam->unk_A4) {
            rot.x = cam->unk_A4;
        }
        cam->rot = rot;
        cam->rotCopy = cam->rot;
        cam->unk_06 = rot.z;
        cam->prev = rot;
        return;
    }
    pos = cam->pos;
    if (cam->flags & 0x40) {
        target = cam->target;
        from = cam->pos.x;
        diff = target->x - from;
        limit = cam->unk_88;
        axis = &pos.x;
    } else {
        target = cam->target;
        from = cam->pos.y;
        diff = target->y - from;
        limit = cam->unk_8C;
        axis = &pos.y;
    }
    if ((from - limit < 0 ? limit - from : from - limit) > cam->unk_98) {
        diff = (diff / (cam->unk_9C << 8)) << 8;
    }
    *axis += diff;
    cam->next = pos;
    cam->pos = cam->next;
    if (cam->flags & 2) {
        return;
    }
    d[0] = func_800A69D8((cam->target->x - cam->pos.x) >> 16, (cam->target->y - cam->pos.y) >> 16) << 16;
    d[1] = cam->target->z - cam->pos.z;
    rot.x = func_800B9208(d);
    if ((cam->flags & 0x200) && rot.x < (s16)cam->unk_A4) {
        rot.x = cam->unk_A4;
    }
    rot.y = 0;
    d[0] = cam->target->x - cam->pos.x;
    d[1] = cam->target->y - cam->pos.y;
    rot.z = func_800B9208(d);
    if (rot.x - cam->prev.x >= 0x800 || cam->prev.x - rot.x >= 0x800) {
        rot.x -= 0x1000;
    }
    if (rot.z - cam->prev.z >= 0x800 || cam->prev.z - rot.z >= 0x800) {
        rot.z -= 0x1000;
    }
    cam->rot.x = cam->prev.x + (rot.x - cam->prev.x) / cam->unk_A0;
    cam->rot.y = 0;
    cam->rot.z = cam->prev.z + (rot.z - cam->prev.z) / cam->unk_A0;
    cam->rotCopy = cam->rot;
    cam->unk_06 = cam->rot.z;
    cam->prev = cam->rot;
}
