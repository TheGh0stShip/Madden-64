#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} GfxWords;

extern GfxWords *D_8007AB24;
extern u16 display_vertex_batch_append(void *vertices);

void display_strip_emit(void *vertices, u16 *indices)
{
    u16 base;
    u16 i;

    base = display_vertex_batch_append(vertices);
    i = 0;
    do {
        GfxWords *g = D_8007AB24++;

        i++;
        g->w0 = ((((indices[0] + base) * 2) & 0xFF) << 16) | ((((indices[1] + base) * 2) & 0xFF) << 8) |
                (((indices[2] + base) * 2) & 0xFF) | 0xB1000000;
        g->w1 = ((((indices[0] + base) * 2) & 0xFF) << 16) |
                ((((indices[2] + base) * 2) & 0xFF) << 8) | (((indices[3] + base) * 2) & 0xFF);
        indices++;
    } while (i < 6);
}
