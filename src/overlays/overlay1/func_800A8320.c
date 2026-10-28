#include "types.h"

typedef struct {
    s32 x;
    s32 y;
    s32 z;
} Vec3;

typedef struct {
    u16 x;
    s16 y;
    u16 z;
} Rot;

typedef struct {
    s32 height;
    s32 depth;
    u16 angle;
    u16 pad0A;
} KindInfo;

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
    s16 a[3];
    u8 pad52[2];
    s16 b[3];
    u8 pad5A[0x1A];
    s16 c[3];
    u8 pad7A[2];
    s16 d[3];
    u8 pad82[0x1E];
    s32 unkA0;
} Obj;

extern s32 D_80080C10;
extern KindInfo D_8006A918[];

s32 func_8000C8EC(s32);
void func_800A2E58(Obj *, Vec3 *);
void func_800A2EB4(Obj *, Rot *);
void func_800A6A70(Obj *, s32, s32);

void func_800A8320(Obj *obj) {
    Vec3 pos;
    Rot rot;

    obj->a[0] = 4;
    obj->a[1] = 4;
    obj->a[2] = 4;
    obj->b[0] = 7;
    obj->b[1] = 7;
    obj->b[2] = 7;
    obj->c[0] = 4;
    obj->c[1] = 4;
    obj->c[2] = 4;
    obj->d[0] = 5;
    obj->d[1] = 5;
    obj->d[2] = 5;
    rot.y = 0;
    pos.x = obj->body->x;
    if (func_8000C8EC(obj->team) != 0) {
        rot.z = 0x7FF;
    } else {
        rot.z = 0;
    }
    obj->height = D_8006A918[obj->kind].height;
    pos.z = D_8006A918[obj->kind].depth;
    rot.x = D_8006A918[obj->kind].angle;
    switch (obj->kind) {
        case 3:
        case 5:
            if (D_80080C10 & 0x4000) {
                obj->a[0] = 0;
                obj->a[1] = 0;
                obj->a[2] = 0;
                obj->b[0] = 0;
                obj->b[1] = 0;
                obj->b[2] = 0;
            }
            break;
        case 4:
            obj->b[1] = 5;
            obj->a[1] = 3;
            break;
        case 6:
            obj->height += obj->height / 4;
            func_800A6A70(obj, 0x1DD, 0x11);
            rot.z += obj->unkA0;
            break;
    }
    pos.y = obj->body->y - obj->height;
    func_800A2E58(obj, &pos);
    func_800A2EB4(obj, &rot);
}
