#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Position;

typedef struct {
    u8 pad00[0x24];
    Position *position;
} Actor;

extern s32 D_80088090;

s32 func_8000C8EC(s32);

s32 func_800BA4E4(Actor *arg0, s16 axis) {
    s32 value = 0;

    switch (axis) {
        case 0:
            value = arg0->position->x;
            break;
        case 1:
            value = arg0->position->y;
            break;
    }
    if (func_8000C8EC(D_80088090) != 0) {
        value = -value;
    }
    return value >> 16;
}
