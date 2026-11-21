#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx;

typedef struct {
    s32 unk_00;
    Vtx *verts;
    s32 count;
    s32 texture;
} LineSet;

extern Gfx *D_80084F5C;
extern Vtx D_80065580[];
extern Vtx D_80068F80[];
extern Vtx D_80068680[];
extern u8 D_00076500[];
extern u8 D_000523A8[];
extern u8 D_00075D00[];
extern u8 D_00050F78[];

void func_80008FA0(void);
void func_8000BC74(void);
void func_8000A3C0(s32);
void func_80009E14(s32);
void func_8000A63C(s32, s32);
void func_8000B008(s32);
void func_8000AFA8(s32);
void func_8000AE60(s32, s32);
void func_8000A984(s32);
void func_8000A08C(s32, s32, s32, s32);
void func_8000A270(s32);
void func_80009E58(s32);
void func_8000A830(s32);
void func_8000B1D8(s32, s32, s32, s32, s32);
void func_80009E9C(s32);
void func_8000A940(s32);
void func_80009310(s32, s32);
void func_8000979C(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32);
void func_8000A8B8(s32);
void func_8000A874(s32);
void func_8000A8FC(s32);

#define GFX2(word0, word1)          \
    {                               \
        Gfx *g = D_80084F5C++;      \
        g->w0 = (word0);            \
        g->w1 = (word1);            \
    }

#define VTX(v, n) GFX2(0x04000000 | ((((n) << 10) | ((n) * 16 - 1)) & 0xFFFF), (u32)(v))
#define TRI_W(a, b, c) ((((a) * 2) & 0xFF) << 16 | (((b) * 2) & 0xFF) << 8 | (((c) * 2) & 0xFF))

void func_80099BD4(LineSet *set) {
    Vtx *verts;
    s32 count;
    s32 remaining;
    s32 drawn;
    s32 loaded;
    s32 idx;
    s32 n;
    s32 max;

    GFX2(0xE7000000, 0);
    GFX2(0xB4000000, (u32)D_00076500);
    GFX2(0xAF0007FF, (u32)D_000523A8);
    func_80008FA0();
    func_8000BC74();
    GFX2(0xE7000000, 0);
    func_8000A3C0(0x100000);
    func_80009E14(0x800000);
    GFX2(0xFCFFFFFF, 0xFFFE793C);
    func_8000A63C(0x407048, 0x107048);
    func_8000B008(0xE3001);
    func_8000AFA8(0x10204);
    func_8000AE60(-800, 900);

    drawn = 0;
    loaded = 0;
    idx = 0;
    count = set->count;
    verts = set->verts;
    remaining = count * 2;
    while (count--) {
        if (drawn >= loaded) {
            if (remaining < 32) {
                n = remaining;
            } else {
                n = 32;
            }
            remaining -= n;
            VTX(&verts[drawn], n);
            loaded += n;
            idx = 0;
        }
        GFX2(0xB5000000, TRI_W(idx, idx + 1, 0));
        idx += 2;
        drawn += 2;
    }

    GFX2(0xE7000000, 0);
    GFX2(0xB4000000, (u32)D_00075D00);
    GFX2(0xAF0007FF, (u32)D_00050F78);
    func_80008FA0();
    func_8000BC74();
    GFX2(0xE7000000, 0);
    func_8000A3C0(0x100000);
    func_80009E14(0);
    func_8000A63C(0xC080000, 0x1041C8);
    func_8000B008(0xE3001);
    func_8000AFA8(0x10204);
    func_8000A984(0x80000);
    func_8000A08C(200, 200, 200, 0);
    func_8000AE60(-800, 900);
    GFX2(0xFCFFFFFF, 0xFFFE793C);
    func_8000A270(0);
    func_80009E58(0);
    func_8000A830(0xC00);
    func_8000B1D8(0x8000, 0x8000, 0, 0, 0);
    func_80009E9C(0);
    VTX(D_80065580, 20);
    GFX2(0xB1081000, 0x00080018);
    GFX2(0xB1120A1A, 0x00121A02);
    GFX2(0xB1041C0C, 0x00040C14);
    GFX2(0xB11E0616, 0x001E160E);
    GFX2(0xB1101202, 0x00100200);
    GFX2(0xB1021A22, 0x00022226);
    GFX2(0xB126221C, 0x00261C04);
    GFX2(0xB1060414, 0x00061416);
    GFX2(0xB1202406, 0x0020061E);
    GFX2(0xB1180024, 0x00182420);
    GFX2(0xE7000000, 0);
    func_8000AE60(-800, 0x36B);

    drawn = 0;
    loaded = 0;
    idx = 0;
    remaining = 48;
    count = 8;
    max = 30;
    while (count--) {
        if (drawn >= loaded) {
            n = max;
            if (remaining < n) {
                n = remaining;
            }
            remaining -= n;
            VTX(&D_80068F80[drawn], n);
            loaded += n;
            idx = 0;
        }
        GFX2(0xB1000000 | TRI_W(idx, idx + 1, idx + 2), TRI_W(idx + 3, idx + 4, idx + 5));
        idx += 6;
        drawn += 6;
    }

    GFX2(0xE7000000, 0);
    func_8000A3C0(0);
    func_80009E14(0);
    func_8000A63C(0x4041C8, 0x1041C8);
    func_8000A940(0x8000);
    func_80009310(0, set->texture + 0x528);
    func_8000979C(set->texture, 2, 0x50, 0x21, 0, 2, 2, 0, 0, 0, 0);
    func_80009E58(0);
    func_8000A984(0x80000);
    func_8000A8B8(0x2000);
    func_8000A830(0xC00);
    func_8000A874(0);
    func_8000A8FC(0);
    func_8000B1D8(0x8000, 0x8000, 0, 0, 1);
    GFX2(0xFC121824, 0xFF33FFFF);

    drawn = 0;
    loaded = 0;
    idx = 0;
    remaining = 144;
    count = 36;
    while (count--) {
        if (drawn >= loaded) {
            if (remaining < 32) {
                n = remaining;
            } else {
                n = 32;
            }
            remaining -= n;
            VTX(&D_80068680[drawn], n);
            loaded += n;
            idx = 0;
        }
        GFX2(0xB1000000 | TRI_W(idx, idx + 1, idx + 3), TRI_W(idx, idx + 3, idx + 2));
        idx += 4;
        drawn += 4;
    }
}
