#include "types.h"

typedef struct {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
    u8 pad24[8];
    s32 vx;
    s32 vy;
} Node;

typedef struct {
    u8 pad00[0x1F];
    u8 slot;
    u8 pad20[4];
    Node *node;
    u8 pad28[4];
    s32 state;
} Marker;

typedef struct {
    s32 x;
    s32 y;
    u8 pad08[8];
} Spot;

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    s32 w;
} Vec4;

extern Spot D_80080C40[];
extern s32 D_800854A4;
extern Node *D_8008741C;
extern Node *D_8008762C;
extern s32 D_80087950;
extern s32 D_80087A64;
extern s32 D_8008931C;

void func_8000D834(s32 heap, s32 handle);
void func_8000D874(s32 a, s32 b);
void func_8009F1DC(Vec4 at, s32 a, s32 b, s32 c, s32 d);
s32 func_800B9208(Vec4 *delta);
void func_800C0018(Marker *marker, s16 angle, s32 c);
void func_800C0C8C(Marker *marker, s32 state);
void func_800C16A0(Marker *marker, s32 facing);

s32 func_800A5AE4(Marker *marker) {
    Vec4 delta;
    Vec4 mid;
    s32 x;
    s32 dx;
    s32 dy;
    s32 handle;

    delta.x = D_80080C40[marker->slot - 4].x - marker->node->x;
    delta.y = D_80080C40[marker->slot - 4].y - marker->node->y;
    if ((delta.x | delta.y) == 0) {
        if (marker->state == 0x200) {
            return 0;
        }
        func_800C16A0(marker, (marker->node->x >= -0x1900000) ? 0xC00 : 0x400);
        if (marker->state == 0x201) {
            func_800C0C8C(marker, 0x200);
        }
        x = D_8008741C->x;
        if (x < -0x1900000) {
            handle = D_80087950;
            if (handle == 0) {
                goto moved;
            }
            if (x > 0x18FFFFF) {
                goto moved;
            }
        } else {
            handle = D_80087950;
            if (handle == 0) {
                goto moved;
            }
            if (x <= 0x1900000) {
                goto moved;
            }
        }
        func_8000D874(D_80087A64, handle);
        func_8000D834(D_8008931C, D_80087950);
        D_80087950 = 0;
    }
moved:
    if (delta.x != 0 || delta.y != 0) {
        func_800C0018(marker, func_800B9208(&delta), 0);
        if (marker->state == 0x200) {
            func_800C0C8C(marker, 0x201);
        }
        if ((delta.x < 0 ? -delta.x : delta.x) <= 0x7FFFF) {
            if ((delta.y < 0 ? -delta.y : delta.y) <= 0x7FFFF) {
                marker->node->vx = 0;
                marker->node->vy = 0;
                marker->node->x = D_80080C40[marker->slot - 4].x;
                marker->node->y = D_80080C40[marker->slot - 4].y;
                delta.x = 0;
                delta.y = 0;
            }
        }
    }
    if (delta.x != 0 && D_800854A4 != 0) {
        mid.x = (D_8008741C->x + D_8008762C->x) >> 1;
        mid.y = (D_8008741C->y + D_8008762C->y) >> 1;
        func_8009F1DC(mid, 8, 8, 8, 0);
    }
    return 0;
}
