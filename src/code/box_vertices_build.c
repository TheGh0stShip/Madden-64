#include "types.h"

void box_vertices_build(s32 *vertices, const volatile s32 *center,
                        const volatile s32 *extent)
{
    s32 center_x = center[0];
    s32 center_y = center[1];
    s32 center_z = center[2];
    s32 extent_x = extent[0];
    s32 extent_y = extent[1];
    s32 extent_z = extent[2];
    s32 x0 = center_x - extent_x;
    s32 y1 = center_y + extent_y;
    s32 z0 = center_z - extent_z;
    s32 x1 = center_x + extent_x;
    s32 z1 = center_z + extent_z;
    s32 y0 = center_y - extent_y;

    vertices[0] = x0;  vertices[1] = y1;  vertices[2] = z0;
    vertices[4] = x1;  vertices[5] = y1;  vertices[6] = z0;
    vertices[8] = x1;  vertices[9] = y1;  vertices[10] = z1;
    vertices[12] = x0; vertices[13] = y1; vertices[14] = z1;
    vertices[16] = x0; vertices[17] = y0; vertices[18] = z0;
    vertices[20] = x1; vertices[21] = y0; vertices[22] = z0;
    vertices[24] = x1; vertices[25] = y0; vertices[26] = z1;
    vertices[28] = x0; vertices[29] = y0; vertices[30] = z1;
}
