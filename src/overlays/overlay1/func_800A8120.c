#include "types.h"

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
    s32 handle;
    s32 height;
    u8 pad1C[0x4C - 0x1C];
    s16 range4C[3];
    u8 pad52[2];
    s16 range54[3];
    u8 pad5A[0x74 - 0x5A];
    s16 range74[3];
    u8 pad7A[2];
    s16 range7C[3];
    u8 pad82[0xA0 - 0x82];
    s32 heading;
} Actor;

typedef struct {
    s32 height;
    s32 z;
    u16 rx;
} KindInfo;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3i;

typedef struct {
    u16 x;
    s16 y;
    s16 z;
} Rot3;

extern s32 D_80080C10;
extern KindInfo D_8006A87C[];

s32 func_8000C8EC(s32 handle);
void func_800A2E58(Actor *actor, Vec3i *pos);
void func_800A2EB4(Actor *actor, Rot3 *rot);
void func_800A6A70(Actor *actor, s32 a, s32 b);

void func_800A8120(Actor *actor) {
    Vec3i pos;
    Rot3 rot;

    actor->range4C[0] = 4;
    actor->range4C[1] = 4;
    actor->range4C[2] = 4;
    actor->range54[0] = 7;
    actor->range54[1] = 7;
    actor->range54[2] = 7;
    actor->range74[0] = 4;
    actor->range74[1] = 4;
    actor->range74[2] = 4;
    actor->range7C[0] = 5;
    actor->range7C[1] = 5;
    actor->range7C[2] = 5;
    rot.y = 0;
    pos.x = actor->body->x;
    if (func_8000C8EC(actor->handle) != 0) {
        rot.z = 0x7FF;
    } else {
        rot.z = 0;
    }
    actor->height = D_8006A87C[actor->kind].height;
    pos.z = D_8006A87C[actor->kind].z;
    rot.x = D_8006A87C[actor->kind].rx;
    switch (actor->kind) {
        case 3:
            if (D_80080C10 & 0x4000) {
                actor->range4C[0] = 0;
                actor->range4C[1] = 0;
                actor->range4C[2] = 0;
                actor->range54[0] = 0;
                actor->range54[1] = 0;
                actor->range54[2] = 0;
            }
            break;
        case 4:
            actor->range54[1] = 6;
            break;
        case 2:
            actor->range4C[0] = 3;
            actor->range4C[1] = 3;
            actor->range4C[2] = 4;
            actor->range54[0] = 5;
            actor->range54[1] = 5;
            actor->range54[2] = 7;
            break;
        case 6:
            actor->height += actor->height / 4;
            func_800A6A70(actor, 0xEE, 0x11);
            rot.z += actor->heading;
            break;
    }
    pos.y = actor->body->y - actor->height;
    func_800A2E58(actor, &pos);
    func_800A2EB4(actor, &rot);
}
