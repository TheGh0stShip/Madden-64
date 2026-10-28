#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Body;

typedef struct {
    u8 pad00[6];
    u16 facing;
    u8 pad08[2];
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
    u8 pad82[0x98 - 0x82];
    s32 stance;
    u8 pad9C[4];
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

extern KindInfo D_8006A7E0[];

s32 func_8000C8EC(s32 handle);
void func_800A2E58(Actor *actor, Vec3i *pos);
void func_800A2EB4(Actor *actor, Rot3 *rot);
void func_800A6C48(Actor *actor);
void func_800B9274(s16 angle, Vec3i *pos, s32 height);

void func_800A971C(Actor *actor) {
    Vec3i pos;
    Rot3 rot;

    actor->range4C[0] = 4;
    actor->range4C[1] = 4;
    actor->range4C[2] = 4;
    actor->range54[0] = 8;
    actor->range54[1] = 8;
    actor->range54[2] = 8;
    actor->range74[0] = 4;
    actor->range74[1] = 4;
    actor->range74[2] = 4;
    actor->range7C[0] = 5;
    actor->range7C[1] = 5;
    actor->range7C[2] = 5;
    rot.y = 0;
    rot.z = actor->facing;
    actor->height = D_8006A7E0[actor->kind].height;
    pos.z = D_8006A7E0[actor->kind].z;
    rot.x = D_8006A7E0[actor->kind].rx;
    switch (actor->kind) {
        case 1:
            actor->height = 0x1400000;
            pos.z = 0xDC0000;
            rot.x = 0x5C8;
            break;
        case 2:
            actor->height = 0x1800000;
            pos.z = 0xDC0000;
            rot.x = 0x578;
            break;
        case 3:
        case 5:
            actor->height = 0x1C00000;
            pos.z = 0xDC0000;
            rot.x = 0x550;
            break;
        case 4:
            actor->height = 0xE00000;
            pos.z = 0xDC0000;
            rot.x = 0x5C8;
            break;
        case 6:
            func_800A6C48(actor);
        case 0:
        case 12:
            actor->height = 0xE00000;
            if (actor->kind == 6) {
                if (actor->stance == 1) {
                    actor->height = 0x1A00000;
                } else if (actor->stance == 0) {
                    actor->height = 0x800000;
                }
            }
            pos.z = 0xDC0000;
            rot.x = 0x5C8;
            break;
    }
    func_800B9274(rot.z, &pos, actor->height);
    if (func_8000C8EC(actor->handle) != 0) {
        pos.x = actor->body->x + pos.x;
        pos.y = actor->body->y + pos.y + actor->height / 8;
    } else {
        pos.x = actor->body->x - pos.x;
        pos.y = actor->body->y - pos.y + actor->height / 8;
    }
    func_800A2E58(actor, &pos);
    func_800A2EB4(actor, &rot);
}
