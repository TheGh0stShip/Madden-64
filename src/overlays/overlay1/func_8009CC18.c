#include "types.h"

typedef struct GfxCommand {
    u32 w0;
    u32 w1;
} GfxCommand;

typedef struct {
    s16 ob[3];
    u16 flag;
    s16 tc[2];
    u8 cn[4];
} Vtx;

typedef struct {
    u8 pad_00[0x4];
    Vtx *unk_04;
    u8 pad_08[0x4];
    s32 unk_0C;
    s32 unk_10;
    u16 unk_14;
    u8 pad_16[0x12];
    s32 unk_28;
    u8 pad_2C[0xA];
    u16 unk_36;
    u8 pad_38[0xA];
    u16 unk_42;
    s32 unk_44;
} Sprite;

typedef struct {
    u8 pad_00[0x8];
    Sprite *unk_08;
} Actor;

extern GfxCommand *D_80084F5C;

#define GFX2(word0, word1)            \
    {                                 \
        u32 first = (word0);          \
        u32 second = (word1);         \
        GfxCommand *g = D_80084F5C++; \
        g->w0 = first;                \
        g->w1 = second;               \
    }
extern s16 D_80087A68;
extern u8 D_80087A94;
void func_80009310(s32, s32);
void func_8000979C(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32);
void func_80009E14(s32);
void func_80009E58(s32);
void func_80009E9C(s32);
void func_8000A08C(s32, s32, s32, s32);
void func_8000A13C(s32, s32, s32, s32);
void func_8000A22C(s32);
void func_8000A3C0(s32);
void func_8000A63C(s32, s32);
void func_8000A830(s32);
void func_8000A874(s32);
void func_8000A8B8(s32);
void func_8000A8FC(s32);
void func_8000A940(s32);
void func_8000A984(s32);
void func_8000AECC(u16, u16);
void func_8000AFA8(s32);
void func_8000B008(s32);
void func_8000B1D8(s32, s32, s32, s32, s32);
u16 *func_80011248(Actor *);

void func_800984F4(Actor *arg0) {
    Sprite *sprite;
    GfxCommand *command;
    u16 *size;
    s32 rows;
    s32 width;
    Vtx *addr;
    s32 count;
    s32 offset;
    s32 loaded;
    s32 line;
    s32 vtx;
    s32 n;

    sprite = arg0->unk_08;
    rows = sprite->unk_44;
    addr = sprite->unk_04;
    width = sprite->unk_14;
    GFX2(0xE7000000, 0);
    func_8000A3C0(0);
    func_80009E14(0);
    func_80009E58(0);
    func_8000A984(0x80000);
    func_8000A8B8(0x2000);
    func_8000A830(0xC00);
    func_8000A874(0);
    func_8000A8FC(0);
    func_8000A13C(0, 0, 0, 0x80);
    func_8000A63C(0x404240, 0x104240);
    func_8000B008(0xE3001);
    func_8000AFA8(0x204);
    func_8000B1D8(0x8000, 0x8000, 0, 0, 1);
    GFX2(0xFC121824, 0xFF33FFFF);
    func_8000A940(0x8000);
    func_80009310(0, sprite->unk_10);
    if (D_80087A94 != 0 && D_80087A68 == 3) {
        GFX2(0xE7000000, 0);
        func_8000A3C0(0x100000);
        GFX2(0xFCFFFFFF, 0xFFFCF838);
        func_8000A22C(0);
        func_8000A8B8(0x2000);
        func_8000A984(0x80000);
        func_8000A874(0);
        func_8000A8FC(0);
        func_8000A830(0xC00);
        func_80009E58(0);
        func_8000B008(0x32205);
        func_8000AFA8(0x10204);
        func_8000A63C(0xC8000000, 0x3024000);
        func_80009E9C(0);
        size = func_80011248(arg0);
        func_8000AECC(size[0], size[1]);
        func_8000A08C(0xFF, 0xFF, 0xFF, 0);
    }
    count = sprite->unk_28;
    offset = 0;
    rows -= 1;
    loaded = -0x20;
    line = 2;
    vtx = 0;
    while (count-- != 0) {
        if (count == 0) {
            rows -= 1;
            if (sprite->unk_42 != 0) {
                rows = sprite->unk_42 + 1;
            }
        }
        func_8000979C(sprite->unk_0C + offset, 2, width, rows, 0, 2, 2, 0, 0, 0, 0);
        if (line >= loaded + 0x20) {
            loaded = line - 2;
            n = sprite->unk_36 - loaded;
            if (n > 0x20) {
                n = 0x20;
            }
            GFX2((((n << 10) | (n * 16 - 1)) & 0xFFFF) | 0x04000000, (u32) &addr[line - 2]);
            vtx = 0;
        }
        if (offset != 0) {
            command = D_80084F5C;
            command[0].w0 = ((vtx * 2) & 0xFFFF) | 0xB2140000;
            command[0].w1 = 0xFFF00010;
            command[1].w0 = (((vtx + 1) * 2) & 0xFFFF) | 0xB2140000;
            command[1].w1 = (((width << 5) - 0x10) << 16) | 0x10;
            D_80084F5C++;
            offset += ((rows - 2) * sprite->unk_14) >> 1;
            D_80084F5C++;
        } else {
            offset = ((rows - 2) * sprite->unk_14) >> 1;
            rows += 1;
        }
        line += 2;
        GFX2((((vtx * 2) & 0xFF) << 16) | ((((vtx + 1) * 2) & 0xFF) << 8) | (((vtx + 3) * 2) & 0xFF) | 0xB1000000, (((vtx * 2) & 0xFF) << 16) | ((((vtx + 3) * 2) & 0xFF) << 8) | (((vtx + 2) * 2) & 0xFF));
        vtx += 2;
    }
}
