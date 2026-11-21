#include "types.h"

typedef struct { u32 w0; u32 w1; } Gfx;
typedef struct { u8 data[0x40]; } Seg;
typedef struct {
    u8 unk_000[0x168];
    Seg unk_168[1];
} Obj;
extern Gfx *D_80084F5C;
extern u16 D_8008AFD4;

void object_display_segment_enable(u8 *object)
{
    Gfx *g;

    if (*(u16 *)(object + 0x1EA) == 1) {
        return;
    }
    g = D_80084F5C++;
    g->w0 = 0x01030040;
    g->w1 = (u32)object + 0x800000A8;
    g = D_80084F5C++;
    g->w0 = 0x01020040;
    g->w1 = (u32)&((Obj *)object)->unk_168[D_8008AFD4] - 0x80000000;
    *(u16 *)(object + 0x1EA) = 1;
}
