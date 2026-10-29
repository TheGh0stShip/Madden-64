#include "types.h"

typedef struct {
    s32 handle;
    u8 pad04[0xA - 0x4];
    u8 side;
    u8 pad0B[0xC - 0xB];
    s32 mode;
} Formation;

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
} Position;

extern void func_8001ECAC(s32 handle, s32 part, s32 arg2);

void func_800E1DA0(Formation *formation, s32 index, Position *pos) {
    s16 tightX[6] = { 0, 0, 0, 0, 7, 7 };
    s16 tightY[6] = { 49, 60, 71, 82, 7, 7 };
    s16 wideX[6] = { 7, 7, 7, 7, 0, 0 };
    s16 wideY[6] = { 7, 7, 7, 7, 57, 76 };

    if (formation->mode != 4) {
        if (formation->mode != 2) {
            pos->x = wideX[index];
            pos->y = wideY[index];
            func_8001ECAC(formation->handle, 8, 0);
            func_8001ECAC(formation->handle, 9, 0);
            func_8001ECAC(formation->handle, index + 4, 6);
        } else {
            u8 parts[4] = { 6, 4, 5, 7 };

            pos->x = tightX[index];
            pos->y = tightY[index];
            func_8001ECAC(formation->handle, 6, 0);
            func_8001ECAC(formation->handle, 4, 0);
            func_8001ECAC(formation->handle, 5, 0);
            func_8001ECAC(formation->handle, 7, 0);
            func_8001ECAC(formation->handle, parts[index], 6);
        }
    }
    if (formation->side == 1) {
        pos->x += 0xB4;
    }
}
