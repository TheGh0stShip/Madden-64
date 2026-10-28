#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Model;

typedef struct {
    u8 pad00[0x24];
    Model *model;
    u16 flags;
} Member;

typedef struct {
    Member *members[22];
} Group;

extern Group D_80085040[];
extern s32 D_80087A70;
extern s32 D_80087A74;
extern Member *D_800880C8;
extern u16 D_8008A5B2;
extern u16 D_8008B672;

void func_800E1A84(Member *, u8 *);
void func_800E1BAC(Member *, u8 *);

void func_800C5B24(s16 team) {
    Member *member;
    Member *nearest;
    s32 best;
    s16 i;
    s32 ady;
    s32 dx;
    s32 dy;
    u8 msg;

    best = 0x7FFFFFFF;
    nearest = NULL;
    for (i = 0; i < (s32)(D_8008B672 >> 1); i++) {
        member = (D_80085040 + team)->members[i];
        dx = (D_80087A70 - member->model->x) >> 4;
        dy = (D_80087A74 - member->model->y) >> 4;
        if (dx < 0) {
            dx = -dx;
        }
        ady = dy;
        if (ady < 0) {
            ady = -ady;
        }
        if (dx < ady) {
            ady += dx / 2;
        } else {
            ady = dx + ady / 2;
        }
        if (ady < best) {
            best = ady;
            nearest = member;
        }
    }
    if (D_8008A5B2 != 5 || D_80087A74 >= (s32)0xFD800000) {
        if (!(nearest->flags & 0x10)) {
            msg = 8;
            func_800E1A84(nearest, &msg);
        } else {
            msg = 8;
            func_800E1BAC(nearest, &msg);
        }
        D_800880C8 = nearest;
    }
}
