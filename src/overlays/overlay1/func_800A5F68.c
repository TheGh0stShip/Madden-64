#include "types.h"

typedef struct {
    u8 unk00[0x14];
    s32 flags;
} Shape;

typedef struct {
    s16 tint;
    u8 unk02[0x16];
    Shape *shape;
    u8 unk1C[0x94];
} Highlight;

extern s32 D_8007A078;
extern Highlight D_80087144[4];

void func_800A5F68(s32 enable) {
    u32 i;

    D_8007A078 = enable;
    for (i = 0; i < 4; i++) {
        if (enable != 0) {
            D_80087144[i].shape->flags |= 0x200;
            D_80087144[i].tint = -0x20;
        } else {
            D_80087144[i].shape->flags &= ~0x200;
            D_80087144[i].tint = 0x80;
        }
    }
}
