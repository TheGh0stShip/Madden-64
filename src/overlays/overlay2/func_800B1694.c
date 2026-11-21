#include "types.h"

typedef struct {
    u8 unk_00[0x8];
    u16 unk_08;
    u16 unk_0A;
    u8 unk_0C;
    u8 unk_0D;
    u8 unk_0E[0xC];
    s16 unk_1A;
} Struct_800B1694_W;

typedef struct {
    u8 unk_00[0xC];
    Struct_800B1694_W *unk_0C;
} Struct_800B1694_B;

typedef struct {
    u8 unk_00[0x320];
    s16 unk_320;
} Struct_800B1694_A;

typedef struct {
    u8 unk_00[0xC];
    Struct_800B1694_A *unk_0C[6];
    Struct_800B1694_B *unk_24[2];
} Struct_800B1694_P;

typedef struct {
    u8 unk_00[0x60];
    Struct_800B1694_P *unk_60;
} Struct_800B1694_Arg;

void func_800DB0AC(Struct_800B1694_W *, s32, s32);
void func_800DB478(Struct_800B1694_W *);

void func_800B1694(Struct_800B1694_Arg *arg0) {
    Struct_800B1694_P *p;
    Struct_800B1694_W *w;
    u32 n;
    u32 i;

    p = arg0->unk_60;
    for (i = 0; i < 2; i++) {
        w = ((Struct_800B1694_B **) ((u8 *) p + i * 4))[9]->unk_0C;
        n = ((Struct_800B1694_A **) ((u8 *) p + i * 4))[3]->unk_320;
        if (n != w->unk_08) {
            if (n == 0) {
                func_800DB0AC(w, 0, 0);
                w->unk_0A = 0;
                w->unk_0D = 0;
                w->unk_08 = 1;
                w->unk_1A = 0;
            } else if (n < w->unk_08) {
                if (n < (u32) (w->unk_0A + w->unk_0C)) {
                    if (w->unk_0C >= n) {
                        w->unk_0A = 0;
                        if (w->unk_0D >= n) {
                            func_800DB0AC(w, n - 1, 0);
                        }
                    } else {
                        w->unk_0A -= w->unk_08 - n;
                    }
                }
                w->unk_08 = n;
            } else {
                w->unk_08 = n;
                if (w->unk_0A < n) { if (w->unk_0A != 0) { n -= w->unk_0A + w->unk_0C; } }
            }
        }
        func_800DB478(w);
    }
}
