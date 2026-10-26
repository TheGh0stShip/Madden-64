#include "types.h"

extern u8 D_8000040C[];
extern s16 D_80087954;
extern u8 D_800692E0[];
extern s32 D_80069288;
extern void *D_80088630;
extern u8 D_800784F4[];
extern s32 D_80078CBC;
extern s32 D_80078D74;
extern s32 D_800785AC;
extern void *D_8007857C;
extern void *D_80078D44;
extern u8 D_80078D6D;
extern void *D_80078504;
extern void *D_80078CCC;
extern u8 D_800785A5;
extern s16 D_80078D18;
extern s16 D_80078550;
extern s32 D_80078D20;
extern s32 D_80078558;

extern u16 func_800356C4(void *data, s32 size);
extern void func_80044F94(u16 handle, s16 *values);
extern void *func_80033AA8(s32 arg0, void *data);
extern void *func_80032E00(s32 arg0, s32 size);
extern void func_80034388(void *state, u32 value);

void func_8001F5D4(void)
{
    register u8 *base __asm__("$16");
    register void *result __asm__("$2");
    register s32 initialized __asm__("$3");
    s16 values[2];
    u16 handle;

    handle = func_800356C4(D_8000040C, 0xBF4);
    D_80087954 = handle;
    values[0] = 0;
    values[1] = 1;
    func_80044F94(handle, values);
    result = func_80033AA8(0, D_800692E0);
    initialized = D_80069288;
    base = D_800784F4;
    D_80088630 = result;
    *(s32 *)(base + 0) = 0;
    D_80078CBC = 0;
    D_80078D74 = 0;
    D_800785AC = 0;
    if (initialized == 0) {
        __asm__("" : "=r"(initialized) : "0"(initialized));
        D_8007857C = func_80032E00(0, 0x800);
        D_80078D44 = func_80032E00(0, 0x800);
        D_80069288 = 1;
    }
    D_80078D6D = 1;
    D_80078504 = base + 0x60;
    D_80078CCC = base + 0x828;
    D_800785A5 = 0;
    D_80078D18 = 7;
    D_80078550 = 7;
    D_80078D20 = 0;
    D_80078558 = 0;
    func_80034388(base + 8, 0x60000);
    func_80034388(base + 0x7D0, 0x60000);
}
