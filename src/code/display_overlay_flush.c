#include "types.h"

extern u8 D_8007AB2C;
extern u32 *D_80084F5C;
extern u32 *D_8007AB24;
extern u16 D_8008AFD4;
extern void *D_8007AB1C[];

extern void func_8000A3C0(s32);
extern void func_80009E14(s32);
extern void func_8000AFA8(s32);
extern void func_8000A63C(u32, u32);
extern void func_8000AD84(void *);

void display_overlay_flush(void)
{
    if (D_8007AB2C != 0) {
        register u32 *command __asm__("$3") = D_80084F5C;
        register u32 *overlay __asm__("$5");
        register u32 index __asm__("$4");
        register u32 word0 __asm__("$6");
        register u32 temp_v0 __asm__("$2");
        register void *argument __asm__("$4");

        D_80084F5C = command + 2;
        command[0] = 0xE7000000;
        command[1] = 0;
        func_8000A3C0(0);
        func_80009E14(0);
        func_8000AFA8(0x2000);
        func_8000A63C(0x00442048, 0x00112048);
        word0 = 0xFC61FEC3;
        command = D_80084F5C;
        overlay = D_8007AB24;
        index = D_8008AFD4;
        temp_v0 = 0x55FE7F3F;
        command[1] = temp_v0;
        temp_v0 = 0xB8000000;
        index <<= 2;
        command[0] = word0;
        overlay[0] = temp_v0;
        overlay[1] = 0;
        argument = *(void **)((u8 *)D_8007AB1C + index);
        D_80084F5C = command + 2;
        D_8007AB24 = overlay + 2;
        func_8000AD84(argument);
        D_8007AB2C = 0;
    }
}
