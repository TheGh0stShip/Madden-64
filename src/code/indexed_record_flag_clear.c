#include "types.h"

typedef struct PackedRecord6 {
    u8 flags;
    u8 rest[5];
} PackedRecord6;

extern s8 D_80086DE4[];
extern PackedRecord6 D_8008B3B4[];

u32 func_80030740(s16 index) {
    s32 mapped = D_80086DE4[index];
    u32 value = D_8008B3B4[mapped].flags & 8;

    return value < 1;
}
