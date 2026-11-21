#include "types.h"

typedef struct FixedVertex {
    s32 x;
    s32 y;
    s32 z;
    s32 unused;
} FixedVertex;

void box_vertices_fixed_build(FixedVertex *vertices, s32 *origin, s32 *extent) {
    s32 x = -origin[0] << 16;
    s32 y = origin[1] << 16;
    s32 z = origin[2] << 16;
    s32 ex = extent[0] << 16;
    s32 ey = extent[1] << 16;
    s32 ez = extent[2] << 16;
    s32 left = x - ex;
    s32 top = y + ey;
    s32 front = z - ez;
    s32 right = x + ex;
    s32 back = z + ez;
    s32 bottom = y - ey;

    vertices[0].x = left;
    vertices[0].y = top;
    vertices[0].z = front;
    vertices[1].x = right;
    vertices[1].y = top;
    vertices[1].z = front;
    vertices[2].x = right;
    vertices[2].y = top;
    vertices[2].z = back;
    vertices[3].x = left;
    vertices[3].y = top;
    vertices[3].z = back;
    vertices[4].x = left;
    vertices[4].y = bottom;
    vertices[4].z = front;
    vertices[5].x = right;
    vertices[5].y = bottom;
    vertices[5].z = front;
    vertices[6].x = right;
    vertices[6].y = bottom;
    vertices[6].z = back;
    vertices[7].x = left;
    vertices[7].y = bottom;
    vertices[7].z = back;
}
