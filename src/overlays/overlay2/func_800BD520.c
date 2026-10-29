#include "types.h"

typedef struct {
    u8 id0;
    u8 id1;
    u8 pad02[2];
    u8 flags;
    u8 pad05;
} Spot;

typedef struct {
    s8 side;
    u8 pad01[0x3D];
    Spot spots[2][15];
} Board;

extern Board D_800C509C;

/* 1 if an active spot (flags low nibble set) on the current side holds id as id0 or id1. */
s32 func_800BD520(u16 id) {
    Spot *spot;
    u16 i;
    s32 found = 0;

    for (i = 0; i < 22; i++) {
        spot = &D_800C509C.spots[D_800C509C.side][i];
        if (!(spot->flags & 0xF)) {
            continue;
        }
        if (id == spot->id0) {
            found = 1;
            break;
        }
        if (id == spot->id1) {
            found = 1;
            break;
        }
    }
    return found;
}
