#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} GfxPair;

extern GfxPair *D_80084F5C;
extern void func_8000A3C0(s32);
extern void func_8000B1D8(s32, s32, s32, s32, s32);
extern void func_8000A63C(s32, s32);
extern void func_80009EE0(s32, s32, s32, s32, s32, s32);
extern void func_80009E58(s32);
extern void func_8000A984(s32);
extern void func_8000A8B8(s32);
extern void func_8000A830(s32);
extern void func_8000A874(s32);
extern void func_8000A8FC(s32);
extern void func_8000A940(s32);
extern void func_80009310(s32, s32);

void display_material_setup(s32 unused, s32 material)
{
    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xE7000000;
        command->w1 = 0;
    }

    func_8000A3C0(0);
    func_8000B1D8(0x8000, 0x8000, 0, 0, 1);
    func_8000A63C(0x443048, 0x113048);
    func_80009EE0(0, 0, 0xFF, 0xFF, 0x33, 0xFF);
    func_80009E58(0);
    func_8000A984(0);
    func_8000A8B8(0x2000);
    func_8000A830(0xC00);
    func_8000A874(0);
    func_8000A8FC(0);

    {
        GfxPair *command = D_80084F5C++;
        command->w0 = 0xFCFFFFFF;
        command->w1 = 0xFFFCF279;
    }
    func_8000A940(0x8000);
    func_80009310(0, material);
}
