#include "types.h"

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx_t;

typedef struct {
    s32 x;
    s32 y;
    s32 pad08[2];
} Point;

typedef struct {
    u8 pad00[4];
    Point *points;
    u8 pad08;
    u8 r;
    u8 g;
    u8 b;
} Shape;

typedef struct {
    u8 pad00[8];
    Vtx_t **vertices;
    u8 pad0C[8];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
} ShapeObject;

void *func_80032E00(s32, s32);

void func_8009F704(ShapeObject *object, Shape *shape) {
    Vtx_t **slot;
    Vtx_t *v;
    u32 i;

    slot = object->vertices;
    v = func_80032E00(0, 0x40);
    *slot = v;
    for (i = 0; i < 4; i++) {
        v[i].ob[0] = -((f32)shape->points[i].x * 7.32421875e-05);
        v[i].ob[1] = -((f32)shape->points[i].y * 7.32421875e-05);
        v[i].ob[2] = 0;
        v[i].flag = 0;
        v[i].cn[3] = 0xFF;
        v[i].cn[0] = shape->r;
        v[i].cn[1] = shape->g;
        v[i].cn[2] = shape->b;
    }
    object->unk14 = 1;
    object->unk18 = 0;
    object->unk24 = 0;
    object->unk20 = 0;
    object->unk1C = 0;
}
