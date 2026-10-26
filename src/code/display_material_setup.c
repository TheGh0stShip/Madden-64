#include "types.h"

extern u32 *D_80084F5C;
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
    register u32 *command __asm__("$3") = D_80084F5C;
    register s32 first_arg __asm__("$4") = 0;
    __asm__ volatile("" : : "r"(command));
    D_80084F5C = command + 2;
    command[0] = 0xE7000000;
    command[1] = 0;

    func_8000A3C0(first_arg);
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
        register u32 word0 __asm__("$6") = 0xFCFFFFFF;
        register u32 word1 __asm__("$5") = 0xFFFC0000;
        __asm__ volatile("" : : "r"(word0), "r"(word1));
        command = D_80084F5C;
        word1 |= 0xF279;
        __asm__ volatile("" : : "r"(command), "r"(word1));
        D_80084F5C = command + 2;
        command[0] = word0;
        command[1] = word1;
    }
    func_8000A940(0x8000);
    func_80009310(0, material);
}
