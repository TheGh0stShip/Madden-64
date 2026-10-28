#include "types.h"

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
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Body;

typedef struct {
    u8 pad00[6];
    u16 heading6;
    u8 pad08[2];
    s16 kind;
    Body *body;
    u8 pad10[4];
    s32 team;
    s32 height;
    u8 pad1C[0x30];
    s16 range_a[3];
    u8 pad52[2];
    s16 range_b[3];
    u8 pad5A[0x1A];
    s16 range_c[3];
    u8 pad7A[2];
    s16 range_d[3];
    u8 pad82[0x1E];
    s32 heading;
} Actor;

typedef struct {
    s32 height;
    s32 distance;
    u16 pitch;
} CameraPreset;

extern s32 D_800721C8;
extern CameraPreset D_8006A7E0[];

s32 func_8000C8EC(s32);
void func_800A2E58(Actor *, Vec3i *);
void func_800A2EB4(Actor *, Vec3s *);
void func_800B9274(s16, Vec3i *, s32);

void func_800A9E5C(Actor *actor) {
    Vec3i pos;
    Vec3s rot;

    actor->range_a[0] = 4;
    actor->range_a[1] = 4;
    actor->range_a[2] = 4;
    actor->range_b[0] = 8;
    actor->range_b[1] = 8;
    actor->range_b[2] = 8;
    actor->range_c[0] = 4;
    actor->range_c[1] = 4;
    actor->range_c[2] = 4;
    actor->range_d[0] = 5;
    actor->range_d[1] = 5;
    actor->range_d[2] = 5;
    rot.y = 0;
    rot.z = actor->heading6;
    actor->height = D_8006A7E0[actor->kind].height;
    pos.z = D_8006A7E0[actor->kind].distance;
    rot.x = D_8006A7E0[actor->kind].pitch;
    if (actor->kind == 1) {
        actor->height = 0x500000;
        rot.x = 0x76C;
        if (D_800721C8 == 0) {
            pos.z = 0x02000000;
        } else {
            pos.z = D_800721C8;
            if (D_800721C8 < 0x02000000) {
                actor->height = 0x280000;
            }
        }
    }
    func_800B9274(rot.z, &pos, actor->height);
    if (func_8000C8EC(actor->team) != 0) {
        pos.x = actor->body->x + pos.x;
        pos.y = actor->body->y + pos.y + actor->height / 8;
    } else {
        pos.x = actor->body->x - pos.x;
        pos.y = actor->body->y - pos.y + actor->height / 8;
    }
    func_800A2E58(actor, &pos);
    func_800A2EB4(actor, &rot);
}
