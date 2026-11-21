#include "types.h"

typedef struct GfxCommand {
    u32 w0;
    u32 w1;
} GfxCommand;

typedef struct {
    u32 unk00;
    u32 tlut[1];
    u8 pad08[4];
    s32 tex;
    s32 palette;
    u16 width;
    u16 height;
    u8 pad18[0x20];
    u16 format;
    u16 flags;
    u16 unk3C;
    u16 unk3E;
} Sprite;

extern GfxCommand *D_80084F5C;
extern s32 D_800784A8;
extern s32 D_800784AC;
extern s16 D_80087A68;
extern u8 D_80087A94;
extern u16 D_8008AFD4;

void func_80009310(s32, s32);
void func_800094D0(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32);
void func_8000979C(s32, s32, s32, s32, s32, s32, s32, s32, s32, s32, s32);
void func_80009E14(s32 value);
void func_80009E58(s32 value);
void func_80009E9C(s32 value);
void func_8000A08C(s32, s32, s32, s32);
void func_8000A13C(s32, s32, s32, s32);
void func_8000A22C(s32 value);
void func_8000A3C0(s32 value);
void func_8000A63C(s32 first, s32 second);
void func_8000A830(s32 value);
void func_8000A874(s32 value);
void func_8000A8B8(s32 value);
void func_8000A8FC(s32 value);
void func_8000A940(s32 value);
void func_8000A984(s32 value);
void func_8000AECC(s32 start, s32 end);
void func_8000AFA8(s32 value);
void func_8000B008(s32 value);
void func_8000B1D8(s32 first, s32 second, s32 third, s32 fourth, s32 fifth);
u16 *func_80011248(u8 *object);

void func_80098980(u8 *object) {
    Sprite *spr;
    GfxCommand *command;
    u16 *range;
    s32 flipx;
    s32 flipy;

    spr = *(Sprite **)(object + 8);
    {
        GfxCommand *cmd = D_80084F5C;
        D_80084F5C = cmd + 1;
        cmd->w0 = 0xE7000000;
        cmd->w1 = 0;
    }
    func_8000A3C0(0);
    func_80009E14(0);
    func_8000A984(0x80000);
    func_8000A830(0xC00);
    func_8000A874(0);
    func_8000A8FC(0);
    func_8000A8B8(0x2000);
    func_8000A13C(0, 0, 0, 0x80);
    func_8000B008(0x10204);
    func_8000B1D8(0xFFFF, 0xFFFF, 0, 0, 1);
    flipx = 0;
    if (spr->flags & 0x400) {
        flipx = 1;
    }
    flipy = 0;
    if (spr->flags & 0x200) {
        flipy = 1;
    }
    switch (spr->format) {
        case 4:
            if (spr->flags & 0x80) {
                func_8000AFA8(0x204);
                {
                    GfxCommand *cmd = D_80084F5C;
                    D_80084F5C = cmd + 1;
                    cmd->w0 = 0xFC121824;
                    cmd->w1 = 0xFF33FFFF;
                }
                func_8000A63C(0x404240, 0x104240);
                func_80009E58(0);
            } else {
                {
                    GfxCommand *cmd = D_80084F5C;
                    D_80084F5C = cmd + 1;
                    cmd->w0 = 0xFCFFFFFF;
                    cmd->w1 = 0xFFFCF279;
                }
                func_8000A63C(0x0C084000, 0x03024000);
                if (D_80087A94 != 0 && D_80087A68 == 3) {
                    {
                        GfxCommand *cmd = D_80084F5C;
                        D_80084F5C = cmd + 1;
                        cmd->w0 = 0xE7000000;
                        cmd->w1 = 0;
                    }
                    func_8000A3C0(0x100000);
                    {
                        GfxCommand *cmd = D_80084F5C;
                        D_80084F5C = cmd + 1;
                        cmd->w0 = 0xFCFFFFFF;
                        cmd->w1 = 0xFFFCF838;
                    }
                    func_8000A22C(0);
                    func_8000A8B8(0x2000);
                    func_8000A984(0x80000);
                    func_8000A874(0);
                    func_8000A8FC(0);
                    func_8000A830(0xC00);
                    func_80009E58(0);
                    func_8000B008(0x32205);
                    func_8000AFA8(0x10204);
                    func_8000A63C(0xC8000000, 0x112048);
                    func_80009E9C(0);
                    range = func_80011248(object);
                    func_8000AECC(range[0], range[1]);
                    func_8000A08C(0xFF, 0xFF, 0xFF, 0);
                }
            }
            func_8000A940(0x8000);
            if (spr->palette != D_800784A8) {
                func_80009310(0, spr->palette);
                D_800784A8 = spr->palette;
            }
            if (spr->tex != D_800784AC) {
                func_8000979C(spr->tex, 2, spr->width, spr->height, 0, flipx, flipy, spr->unk3C, spr->unk3E, 0, 0);
                D_800784AC = spr->tex;
            }
            break;
        case 16:
            {
                GfxCommand *cmd = D_80084F5C;
                D_80084F5C = cmd + 1;
                cmd->w0 = 0xFCFFFFFF;
                cmd->w1 = 0xFFFCF279;
            }
            func_8000A63C(0x0C084000, 0x03024000);
            func_80009E58(0);
            func_8000A940(0);
            if (spr->tex != D_800784AC) {
                func_800094D0(spr->tex, 0, 2, spr->width, spr->height, 0, flipx, flipy, spr->unk3C, spr->unk3E, 0, 0);
                D_800784AC = spr->tex;
            }
            break;
    }
    command = D_80084F5C;
    command->w0 = 0x0400103F;
    command->w1 = spr->tlut[D_8008AFD4];
    D_80084F5C = command + 1;
    D_80084F5C->w0 = 0xB1000204;
    D_80084F5C = command + 2;
    command[1].w1 = 0x406;
}
