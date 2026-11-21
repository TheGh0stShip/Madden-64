#include "types.h"

typedef struct {
    u8 pad_00[0x1C];
    s32 unk_1C;
    s32 unk_20;
} Body;

typedef struct {
    u8 pad_00[0x24];
    Body *unk_24;
    u8 pad_28[0x3E];
    u8 unk_66;
    u8 pad_67[0x2D];
    s32 unk_94;
    s32 unk_98;
    s32 unk_9C;
} Player;

typedef struct {
    Player *unk_00[22];
} Team;

typedef struct {
    s16 unk_00;
    s16 unk_02;
} Span;

typedef struct {
    s32 unk_00;
    s32 unk_04;
} Point;

extern Span D_80069DB8[];
extern Point D_80084F30;
extern s32 D_80084F34;
extern Player *D_80085040[][22];
extern s8 D_800886E8[];
extern s16 D_80088AE4;
s16 func_800B9208(s32 *);

void func_800DDFCC(Player *arg0) {
    s32 vec[3];
    Player *found = 0;
    s32 i;
    s32 lo = (D_80069DB8[arg0->unk_66 + 13].unk_00 << 16) + D_80084F30.unk_00;
    s32 hi = (D_80069DB8[arg0->unk_66 + 13].unk_02 << 16) + D_80084F30.unk_00;
    s32 mid;

    for (i = 0; i < 5; i++) {
        Player *p = D_80085040[D_80088AE4][D_800886E8[i]];
        if (D_80084F30.unk_04 + 0x600000 < p->unk_24->unk_20 && lo < p->unk_24->unk_1C && p->unk_24->unk_1C < hi) {
            found = p;
            break;
        }
    }
    mid = (hi - lo) / 2 + lo;
    vec[0] = mid;
    if (found != 0) {
        vec[0] = mid + (found->unk_24->unk_1C - mid) * 3 / 4;
    }
    vec[0] -= arg0->unk_24->unk_1C;
    if (arg0->unk_24->unk_20 < D_80084F34 + 0xC00000) {
        vec[1] = arg0->unk_24->unk_20 - 0x1000000;
        vec[1] = D_80084F34 - vec[1];
    } else {
        vec[1] = 0x300000;
    }
    if (arg0->unk_24->unk_20 + vec[1] > 0x3700000) {
        vec[1] = 0x3700000 - arg0->unk_24->unk_20;
    }
    arg0->unk_98 = func_800B9208(vec);
    switch (arg0->unk_94) {
    case 0:
        arg0->unk_94 = 1;
    case 1:
        if (found != 0) {
            if (found->unk_24->unk_20 + 0x800000 < arg0->unk_24->unk_20) {
                vec[1] = -0x300000;
                arg0->unk_98 = func_800B9208(vec);
                arg0->unk_9C = 0x6666;
            } else if (found->unk_24->unk_20 + 0x600000 < arg0->unk_24->unk_20) {
                arg0->unk_98 = -1;
            } else if (found->unk_24->unk_20 + 0x300000 < arg0->unk_24->unk_20) {
                arg0->unk_9C = 0x9999;
            } else {
                arg0->unk_94 = 2;
                arg0->unk_9C = 0x10000;
            }
        } else {
            arg0->unk_9C = 0x9999;
        }
        break;
    case 2:
        if (found == 0) {
            arg0->unk_94 = 1;
            arg0->unk_9C = 0x9999;
        } else if (found->unk_24->unk_20 + 0x600000 < arg0->unk_24->unk_20) {
            arg0->unk_94 = 1;
            arg0->unk_9C = 0xCCCC;
        } else {
            arg0->unk_9C = 0x10000;
        }
        break;
    }
}
