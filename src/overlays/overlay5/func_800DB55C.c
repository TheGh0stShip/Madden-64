#include "types.h"

typedef void (*CellFnA)(u32, u32, s32, s32);
typedef void (*CellFnB)(u16, s32, s32);

typedef struct Grid {
    u8 pad00[8];
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 pad0D[3];
    s32 *unk10;
    u8 pad14[4];
    u16 unk18;
    u16 unk1A;
    u8 unk1C;
    u8 pad1D;
    u8 unk1E;
    u8 pad1F;
    CellFnB *unk20;
    u8 *unk24;
    u8 *unk28;
    u8 unk2C;
    u8 pad2D;
    u8 unk2E;
    u8 pad2F[0x3C - 0x2F];
    s32 *unk3C;
    s32 *unk40;
    s32 unk44;
    u8 pad48[4];
    s32 unk4C;
} Grid;

void func_8001EC20(s32, u32);
extern u32 D_8007A418;

void func_800DB55C(Grid *arg0) {
    CellFnB *fns;
    CellFnA first;
    CellFnB fn;
    u32 end;
    u32 rows;
    u32 r;
    u32 c;
    u32 k;

    fns = arg0->unk20;
    end = arg0->unkA + arg0->unkC;
    first = (CellFnA)fns[0];
    if (arg0->unk8 < arg0->unkC) {
        end = arg0->unk8;
    }
    rows = arg0->unk1C;
    if (arg0->unk18 < arg0->unk1C) {
        rows = arg0->unk18;
    }
    for (r = 0; r < rows; r++) {
        k = arg0->unk28[r];
        D_8007A418 = r;
        if (r >= arg0->unk1E) {
            D_8007A418 = r + arg0->unk1A;
        }
        fn = fns[D_8007A418];
        if (arg0->unk24[r] != 0) {
            for (c = arg0->unkA; c < end; c++) {
                if (arg0->unk2E & 0x40) {
                    first(c, D_8007A418, arg0->unk3C[k], arg0->unk4C);
                } else {
                    fn(c, arg0->unk3C[k], arg0->unk4C);
                }
                func_8001EC20(arg0->unk44, k);
                k++;
            }
            for (c = end; c < arg0->unkA + arg0->unkC; c++, k++) {
                arg0->unk3C[k] = 0;
                func_8001EC20(arg0->unk44, k);
            }
        } else {
            for (c = arg0->unkA; c < end; c++) {
                if (arg0->unk2E & 0x40) {
                    first(c, D_8007A418, (s32)&arg0->unk40[k], arg0->unk4C);
                } else {
                    fn(c, (s32)&arg0->unk40[k], arg0->unk4C);
                }
                k++;
            }
            for (c = end; c < arg0->unkA + arg0->unkC; c++) {
                arg0->unk40[k] = 0;
                k++;
            }
        }
    }
    for (r = rows; r < arg0->unk1C; r++) {
        k = arg0->unk28[r];
        if (arg0->unk24[r] != 0) {
            for (c = 0; c < arg0->unkC; c++, k++) {
                arg0->unk3C[k] = 0;
                func_8001EC20(arg0->unk44, k);
            }
        } else {
            for (c = 0; c < arg0->unkC; c++, k++) {
                arg0->unk40[k] = 0;
            }
        }
    }
    if (arg0->unk10 != 0) {
        u8 start = arg0->unk2C;
        if (start != 0xFF) {
            for (r = 0, k = start; r < (u32)(arg0->unk1C - arg0->unk1E); r++, k++) {
                arg0->unk3C[k] = arg0->unk10[arg0->unk1A + r];
                func_8001EC20(arg0->unk44, k);
            }
        }
    }
}
