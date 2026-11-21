#include "types.h"

typedef struct {
    s32 x : 12;
    s32 y : 12;
    u32 r : 8;
    s32 z : 12;
    u32 g : 8;
    u32 b : 8;
    u32 unk_04 : 4;
} Keyframe;

typedef struct {
    u32 unk_00;
    Keyframe frames[1];
} KeyframeSet;

typedef struct {
    s32 v[3];
} Vec3i;

typedef struct {
    Vec3i pos;
    Vec3i color;
} DisplayState;

s32 func_80042E90(s32 from, s32 to, u8 t);
s32 func_80042EC0(u8 from, u8 to, u8 t);

void display_command_finalize(DisplayState *out, KeyframeSet *from, KeyframeSet *to, u8 index, u8 t) {
    Keyframe *a;
    Keyframe *b;
    Vec3i pos;
    Vec3i color;

    a = &from->frames[index];
    if (to != 0) {
        b = &to->frames[index];
        pos.v[0] = func_80042E90(a->x, b->x, t);
        pos.v[1] = func_80042E90(a->y, b->y, t);
        pos.v[2] = func_80042E90(a->z, b->z, t);
        color.v[0] = func_80042EC0(a->r, b->r, t);
        color.v[1] = func_80042EC0(a->g, b->g, t);
        color.v[2] = func_80042EC0(a->b, b->b, t);
    } else {
        pos.v[0] = a->x << 20;
        pos.v[1] = a->y << 20;
        pos.v[2] = a->z << 20;
        color.v[0] = a->r << 4;
        color.v[1] = a->g << 4;
        color.v[2] = a->b << 4;
    }
    out->pos.v[0] = pos.v[0];
    out->pos.v[1] = pos.v[1];
    out->pos.v[2] = pos.v[2];
    out->color.v[0] = color.v[0];
    out->color.v[1] = color.v[1];
    out->color.v[2] = color.v[2];
}
