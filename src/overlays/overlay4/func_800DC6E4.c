#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Pos;

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
    u8 pad18[0x1C - 0x18];
    s32 unk_1C;
    s32 unk_20;
} Body;

typedef struct {
    u8 pad0[0x24];
    Body *unk_24;
    u16 unk_28;
} Player;

typedef struct {
    Player *unk_00[22];
} Team;

extern s16 D_80088AE4;
extern Player *D_80085040[][22];
s16 func_800B9208(s32 *vec);
s16 func_800C157C(Player *p);
void func_800C0BBC(Player *p, s32 anim);

s32 func_800DAE44(Player *arg0) {
    s32 vec[3];
    s32 i;
    s32 dx;
    s32 dz;
    s32 best;
    s32 angle;

    best = 0x7FFFFFFF;
    angle = 0x7FF;
    for (i = 0; i < 11; i++) {
        vec[0] = D_80085040[D_80088AE4][i]->unk_24->unk_1C - arg0->unk_24->unk_1C;
        vec[1] = D_80085040[D_80088AE4][i]->unk_24->unk_20 - arg0->unk_24->unk_20;
        dx = vec[0];
        if (dx < 0) {
            dx = -dx;
        }
        dz = vec[1];
        if (dz < 0) {
            dz = -dz;
        }
        if (dx < dz) {
            dz = dz + dx / 2;
        } else {
            dz = dx + dz / 2;
        }
        if (dz < best) {
            best = dz;
            angle = func_800B9208(vec);
        }
    }
    angle = (angle - func_800C157C(arg0)) & 0xFFF;
    if (angle < 0x7FF) {
        func_800C0BBC(arg0, 0x31);
    } else {
        func_800C0BBC(arg0, 0x32);
    }
    arg0->unk_24->unk_14 |= 0x10000;
    arg0->unk_28 |= 0x10;
    return 0;
}
