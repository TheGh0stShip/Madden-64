#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Actor;

extern s32 D_800726F8[6];
extern s32 D_80080C10;
extern s16 D_80085024;
extern s32 D_8008775C;
extern Actor *D_80088490[];
extern s32 D_8008931C;
extern u8 D_8008A3FE;

void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_80097D28(s32, s32, s32);

void func_800C10B0(void) {
    u16 i;

    if (D_80080C10 & 0x10) {
        for (i = 0; i < 5; i++) {
            D_80088490[i]->flags &= ~1;
            if (i < D_80085024 && D_8008A3FE == 1) {
                func_80097D28(D_800726F8[i], 0, 0);
                func_8000D874(D_8008775C, D_800726F8[i]);
                func_8000D834(D_8008931C, D_800726F8[i]);
                D_800726F8[i] = 0;
            }
        }
        if (D_8008A3FE == 1) {
            func_80097D28(D_800726F8[5], 0, 0);
            func_8000D874(D_8008775C, D_800726F8[5]);
            func_8000D834(D_8008931C, D_800726F8[5]);
            D_800726F8[5] = 0;
        }
        D_8008A3FE = 0;
        D_80080C10 &= ~0x10;
    }
}
