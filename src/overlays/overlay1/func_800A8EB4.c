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
    u8 pad00[0xA];
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

s32 func_8000C8EC(s32);
void func_800A2E58(Actor *, Vec3i *);
void func_800A2EB4(Actor *, Vec3s *);
void func_800A6A70(Actor *, s32, s32);

void func_800A8EB4(Actor *actor) {
    Vec3i pos;
    Vec3s rot;

    actor->range_a[0] = 4;
    actor->range_a[1] = 4;
    actor->range_a[2] = 4;
    actor->range_b[0] = 7;
    actor->range_b[1] = 7;
    actor->range_b[2] = 7;
    actor->range_c[0] = 4;
    actor->range_c[1] = 4;
    actor->range_c[2] = 4;
    actor->range_d[0] = 5;
    actor->range_d[1] = 5;
    actor->range_d[2] = 5;
    if (func_8000C8EC(actor->team) != 0) {
        rot.z = 0x7FF;
    } else {
        rot.z = 0;
    }
    if (actor->kind == 3) {
        actor->range_a[0] = 0;
        actor->range_a[1] = 0;
        actor->range_a[2] = 0;
        actor->range_b[0] = 0;
        actor->range_b[1] = 0;
        actor->range_b[2] = 0;
    } else if (actor->kind == 6) {
        func_800A6A70(actor, 0xEE, 0x11);
        rot.z += actor->heading;
    }
    rot.x = 0x5A0;
    rot.y = 0;
    pos.x = actor->body->x;
    pos.z = 0xD20000;
    actor->height = 0x01000000;
    pos.y = actor->body->y - 0x01000000;
    func_800A2E58(actor, &pos);
    func_800A2EB4(actor, &rot);
}
