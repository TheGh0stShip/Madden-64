#include "types.h"

typedef struct Body {
    u8 pad[0x1C];
    s32 x;
    s32 z;
} Body;

typedef struct Obj {
    u8 pad[0x24];
    Body *body;
} Obj;

extern s8 D_800857D4;
extern Obj *D_80085040[][22];
extern s16 D_80088AE4;
extern s8 D_800884A4[];

/*
 * Build the slot ordering table D_800884A4[0..4] for the active team
 * (D_80088AE4): fill it with player indices, bubble-sort by body x
 * (descending), then break x ties between slots 2/3 and 3/4 by z.
 * Mode D_800857D4 == 1 sorts all five; otherwise slot 0 and 4 are fixed
 * (players 2 and 1) and only slots 1..3 are sorted.
 */
void func_800D72E0(void) {
    s32 i;
    s32 swapped = 1;
    s32 tmp;

    if (D_800857D4 == 1) {
        for (i = 0; i < 5; i++) {
            D_800884A4[i] = i + 1;
        }
        while (swapped == 1) {
            swapped = 0;
            for (i = 0; i < 4; i++) {
                if (D_80085040[D_80088AE4][D_800884A4[i]]->body->x <
                    D_80085040[D_80088AE4][D_800884A4[i + 1]]->body->x) {
                    swapped = 1;
                    tmp = D_800884A4[i];
                    D_800884A4[i] = D_800884A4[i + 1];
                    D_800884A4[i + 1] = tmp;
                }
            }
        }
    } else {
        D_800884A4[0] = 2;
        D_800884A4[4] = 1;
        for (i = 3; i < 6; i++) {
            D_800884A4[i - 2] = i;
        }
        while (swapped == 1) {
            swapped = 0;
            for (i = 1; i < 3; i++) {
                if (D_80085040[D_80088AE4][D_800884A4[i]]->body->x <
                    D_80085040[D_80088AE4][D_800884A4[i + 1]]->body->x) {
                    swapped = 1;
                    tmp = D_800884A4[i];
                    D_800884A4[i] = D_800884A4[i + 1];
                    D_800884A4[i + 1] = tmp;
                }
            }
        }
    }
    if (D_80085040[D_80088AE4][D_800884A4[2]]->body->x == D_80085040[D_80088AE4][D_800884A4[3]]->body->x &&
        D_80085040[D_80088AE4][D_800884A4[2]]->body->z < D_80085040[D_80088AE4][D_800884A4[3]]->body->z) {
        tmp = D_800884A4[2];
        D_800884A4[2] = D_800884A4[3];
        D_800884A4[3] = tmp;
    }
    if (D_80085040[D_80088AE4][D_800884A4[3]]->body->x == D_80085040[D_80088AE4][D_800884A4[4]]->body->x &&
        D_80085040[D_80088AE4][D_800884A4[3]]->body->z > D_80085040[D_80088AE4][D_800884A4[4]]->body->z) {
        tmp = D_800884A4[3];
        D_800884A4[3] = D_800884A4[4];
        D_800884A4[4] = tmp;
    }
}
