#include "types.h"

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx_t;

typedef union {
    Vtx_t v;
} Vtx;

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

typedef struct ArchiveState {
    u8 pad0[4];
    s32 unk_04;
    s32 unk_08;
    u8 padC[4];
    u16 unk_10;
    u8 pad12[4];
    s16 unk_16;
    s16 unk_18;
    s16 unk_1A;
    s16 unk_1C;
    s16 unk_1E;
    u8 pad20[0x18];
    s16 unk_38;
    u8 pad3A[6];
    Vtx *unk_40[2];
} ArchiveState;

typedef struct ArchiveOwner {
    u8 pad0[8];
    ArchiveState *state;
    u8 padC[0x10];
    s32 unk_1C;
    s32 unk_20;
} ArchiveOwner;

extern Gfx *D_80084F5C;
extern u16 D_8008AFD4;
extern s32 D_8008B654;
extern void func_800093F4(s32);
extern void func_800094D0(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32);
extern void func_80009E14(s32);
extern void func_80009E58(s32);
extern void func_8000A13C(s32, s32, s32, s32);
extern void func_8000A3C0(s32);
extern void func_8000A63C(u32, u32);
extern void func_8000A830(s32);
extern void func_8000A874(s32);
extern void func_8000A8B8(s32);
extern void func_8000A8FC(s32);
extern void func_8000A940(s32);
extern void func_8000A984(s32);
extern void func_8000AFA8(u32 mask);
extern void func_8000B008(u32 mask);
extern void func_8000B1D8(s32, s32, s32, s32, s32);
extern void func_8000C810(s32);

#define GFX2(word0, word1)           \
    {                                 \
        u32 first = (word0);          \
        u32 second = (word1);         \
        Gfx *g = D_80084F5C++;        \
        g->w0 = first;                \
        g->w1 = second;               \
    }

void resource_archive_process(ArchiveOwner *owner) {
    ArchiveState *state = owner->state;
    Vtx *vtx;
    s32 i;
    s32 x, y, right, bottom;
    s32 rows, step, h, rowBytes;
    s32 tex;
    s32 first, base, n, idx;

    if (state->unk_38 == 1) {
        vtx = state->unk_40[D_8008AFD4];
        func_8000C810(D_8008B654);
        GFX2(0xE7000000, 0);
        func_8000A3C0(0);
        func_80009E14(0x800000);
        func_80009E58(0);
        func_8000A984(0x80000);
        func_8000A8B8(0);
        func_8000A830(0xC00);
        func_8000A874(0);
        func_8000A8FC(0);
        func_8000A13C(0, 0, 0, 0x80);
        func_8000A63C(0x404340, 0x104340);
        func_8000B008(0xE3001);
        func_8000AFA8(0x204);
        func_8000B1D8(0x8000, 0x8000, 0, 0, 1);
        GFX2(0xFC121824, 0xFF33FFFF);
        func_8000A940(0x8000);
        func_800093F4(state->unk_08);
        rows = state->unk_1E;
        step = 0x800 / rows;
        first = 0;
        y = *(u16 *)(D_8008B654 + 0x1FA) + owner->unk_20 + state->unk_18 - (*(u16 *)(D_8008B654 + 0x1FE) >> 1);
        x = *(u16 *)(D_8008B654 + 0x1F8) + owner->unk_1C + state->unk_16 - (*(u16 *)(D_8008B654 + 0x1FC) >> 1);
        right = x + state->unk_1A;
        bottom = y + state->unk_1C;
        h = step;
        i = state->unk_10 >> 1;
        while (i--) {
            vtx[0].v.ob[0] = x;
            vtx[1].v.ob[0] = right;
            vtx[1].v.tc[0] = state->unk_1A << 6;
            if (bottom < y) {
                step -= y - bottom;
                y = bottom;
            }
            vtx[0].v.ob[1] = vtx[1].v.ob[1] = y;
            vtx[0].v.tc[1] = vtx[1].v.tc[1] = step << 6;
            y += step;
            vtx += 2;
        }
        step = h;
        base = -0x20;
        vtx = state->unk_40[D_8008AFD4];
        n = 2;
        rowBytes = rows * step;
        vtx[1].v.tc[1] = 0;
        vtx[0].v.tc[1] = 0;
        idx = 0;
        tex = state->unk_04;
        i = state->unk_10 >> 1;
        i--;
        while (i--) {
            func_800094D0(tex, 2, 1, rows, step, 0, 2, 2, 0, 0, 0, 0);
            if (n >= base + 0x20) {
                s32 count;
                base = n - 2;
                count = state->unk_10 - base;
                if (count > 0x20) {
                    count = 0x20;
                }
                idx = 0;
                GFX2((((count << 10) | ((count << 4) - 1)) & 0xFFFF) | 0x04000000, (u32)&vtx[n - 2]);
            }
            if (first) {
                { Gfx *g = D_80084F5C++; g->w0 = ((idx * 2) & 0xFFFF) | 0xB2140000; g->w1 = 0; }
                { Gfx *g = D_80084F5C++; g->w0 = (((idx + 1) * 2) & 0xFFFF) | 0xB2140000; g->w1 = state->unk_1A << 21; }
            } else {
                first = 1;
            }
            tex += rowBytes;
            n += 2;
            GFX2((((idx * 2) & 0xFF) << 16) | (((idx + 1) << 9) & 0xFE00) | (((idx + 3) * 2) & 0xFF) | 0xB1000000,
                 (((idx * 2) & 0xFF) << 16) | ((((idx + 3) * 2) & 0xFF) << 8) | (((idx + 2) * 2) & 0xFF));
            idx += 2;
        }
    }
}
