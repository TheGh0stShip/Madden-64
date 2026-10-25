#include "types.h"

extern u8 D_80086C64;
extern s8 D_80087B1B;
extern u8 D_80085C00[];
extern u8 D_80085E48[];
extern u8 D_80088488[];
extern u8 D_80088110[];
extern u8 D_8008B790[];
extern void func_8003CEB8(s32, s32, s32, s32);
extern s32 func_8003DB28(s32, s32, s32);

void audio_runtime_prepare(void)
{
    s32 slot;

    if (D_80086C64 == 0) {
        func_8003CEB8(11, 60, 0, 16);
        slot = D_80087B1B;
        if (slot >= 0) {
            s32 value;

            D_80085C00[slot] = 0;
            D_80085E48[slot] = 0;
            value = func_8003DB28(11, 100, 0) << 4;
            D_80088488[slot] = value;
            D_80088110[slot] = value;
            D_8008B790[slot] = 1;
            D_80086C64 = 1;
        }
    }
}
