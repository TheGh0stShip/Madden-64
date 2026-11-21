#include "types.h"

typedef struct {
    u8 pad00[0xC];
    s32 unkC;
    s32 unk10;
    s32 unk14;
    s16 unk18;
    u8 pad1A[2];
    u16 flags;
} State;

typedef struct {
    u8 pad00[4];
    State *state;
    u8 pad08[0x68];
    s32 heap;
    u8 pad74[4];
    s32 unk78;
    s32 unk7C;
    s32 unk80;
    s32 unk84;
    s32 unk88;
    u8 pad8C[4];
    s32 unk90;
    s32 unk94;
    s32 unk98;
} Context;

extern Context *D_80072380;
extern s32 D_8008931C;

void func_8000D834(s32, s32);
void func_8000D874(s32, s32);
void func_80094AB0(s32);
void overlay5_indexed_resource_release(s32);

void func_800DDDC4(void) {
    if (D_80072380->state->unk18 < 0 && D_80072380->unk90 != 0) {
        func_80094AB0(D_80072380->heap);
        D_80072380->unk90 = 0;
    }
    if (D_80072380->state->unk10 == 0 && D_80072380->unk78 != 0) {
        func_8000D874(D_80072380->heap, D_80072380->unk78);
        func_8000D834(D_8008931C, D_80072380->unk78);
        D_80072380->unk78 = 0;
    }
    if (D_80072380->state->unk14 == 0 && D_80072380->unk7C != 0) {
        func_8000D874(D_80072380->heap, D_80072380->unk7C);
        func_8000D834(D_8008931C, D_80072380->unk7C);
        D_80072380->unk7C = 0;
    }
    if (D_80072380->state->unkC == 0 && D_80072380->unk88 != 0) {
        overlay5_indexed_resource_release(0xC);
        func_8000D874(D_80072380->heap, D_80072380->unk88);
        func_8000D834(D_8008931C, D_80072380->unk88);
        D_80072380->unk88 = 0;
    }
    if (!(D_80072380->state->flags & 1) && D_80072380->unk84 != 0) {
        overlay5_indexed_resource_release(0xE);
        func_8000D874(D_80072380->heap, D_80072380->unk84);
        func_8000D834(D_8008931C, D_80072380->unk84);
        D_80072380->unk84 = 0;
        D_80072380->unk98 = 0;
    }
    if (!(D_80072380->state->flags & 2) && D_80072380->unk80 != 0) {
        overlay5_indexed_resource_release(0xD);
        func_8000D874(D_80072380->heap, D_80072380->unk80);
        func_8000D834(D_8008931C, D_80072380->unk80);
        D_80072380->unk80 = 0;
    }
    if (!(D_80072380->state->flags & 4) && D_80072380->unk94 != 0) {
        func_8000D874(D_80072380->heap, D_80072380->unk94);
        func_8000D834(D_8008931C, D_80072380->unk94);
        D_80072380->unk94 = 0;
    }
}
