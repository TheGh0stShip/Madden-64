#include "types.h"

typedef struct FixedVertex {
    s32 x;
    s32 y;
    s32 z;
    s32 unused;
} FixedVertex;

void box_vertices_fixed_build(FixedVertex *vertices, const s32 *origin,
                              const s32 *extent)
{
    register s32 x __asm__("$2");
    register s32 y __asm__("$3");
    register s32 z __asm__("$5");
    register s32 ex __asm__("$7");
    register s32 ey __asm__("$10");
    register s32 ez __asm__("$8");
    register s32 left __asm__("$11");
    register s32 right __asm__("$2");
    register s32 top __asm__("$6");
    register s32 bottom __asm__("$3");
    register s32 front __asm__("$9");
    register s32 back __asm__("$5");

    x = origin[0];
    y = origin[1];
    z = origin[2];
    ex = extent[0];
    ey = extent[1];
    ez = extent[2];
    x = -x << 16;
    ex <<= 16;
    left = x - ex;
    __asm__ volatile ("" : "=r" (left) : "0" (left));
    y <<= 16;
    ey <<= 16;
    top = y + ey;
    __asm__ volatile ("" : "=r" (top) : "0" (top));
    z <<= 16;
    ez <<= 16;
    front = z - ez;
    __asm__ volatile ("" : "=r" (front) : "0" (front));
    right = x + ex;
    back = z + ez;
    bottom = y - ey;

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
