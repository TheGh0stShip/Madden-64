#include "types.h"

/* Resets the four kickoff start positions and the ball body, mirroring x for the other side. */

typedef struct {
    s32 x;
    s32 y;
    s32 pad08[2];
} StartPosition;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Body;

extern StartPosition D_80080C40[4];
extern s32 D_8008793C;
extern s32 D_80084F34;
extern s32 D_80088090;
extern Body *D_80088480;

s32 func_8000C8EC(s32);

void func_800A0224(void) {
    u32 i;
    s32 y = D_8008793C;

    D_80080C40[0].y = y;
    D_80080C40[0].x = 0xFE500000;
    D_80080C40[1].x = 0x01B00000;
    D_80080C40[1].y = y;
    D_80080C40[2].x = 0xFE600000;
    D_80080C40[2].y = D_80084F34;
    D_80080C40[3].x = 0xFE500000;
    D_80080C40[3].y = y - 0xA00000;
    D_80088480->y = y;
    D_80088480->x = 0x01A50000;
    if (func_8000C8EC(D_80088090)) {
        for (i = 0; i < 4; i++) {
            D_80080C40[i].x = -D_80080C40[i].x;
        }
        D_80088480->x = -D_80088480->x;
    }
}
