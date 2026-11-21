#include "types.h"

typedef struct { u32 w0; u32 w1; } GfxWords;
extern GfxWords *D_80084F5C;
extern u16 D_8008AFD4;

void object_display_segment_emit(u8 *object)
{
    if (*(u16 *)(object + 0x1EA) != 0) {
        {
            GfxWords *g = D_80084F5C++;
            g->w0 = 0x01030040;
            g->w1 = (u32)object + 0x80000068;
        }
        {
            GfxWords *g = D_80084F5C++;
            g->w0 = 0x01020040;
            g->w1 = (u32)(object + 0xE8 + (D_8008AFD4 << 6)) - 0x80000000;
        }
        *(u16 *)(object + 0x1EA) = 0;
    }
}
