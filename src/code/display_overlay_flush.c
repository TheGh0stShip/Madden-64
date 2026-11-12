#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} GfxPair;

extern u8 D_8007AB2C;
extern GfxPair *D_80084F5C;
extern GfxPair *D_8007AB24;
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
        {
            GfxPair *command = D_80084F5C++;
            command->w0 = 0xE7000000;
            command->w1 = 0;
        }
        func_8000A3C0(0);
        func_80009E14(0);
        func_8000AFA8(0x2000);
        func_8000A63C(0x00442048, 0x00112048);
        {
            GfxPair *command = D_80084F5C++;
            command->w0 = 0xFC61FEC3;
            command->w1 = 0x55FE7F3F;
        }
        {
            GfxPair *command = D_8007AB24++;
            command->w0 = 0xB8000000;
            command->w1 = 0;
        }
        func_8000AD84(D_8007AB1C[D_8008AFD4]);
        D_8007AB2C = 0;
    }
}
