#include "types.h"

extern u16 D_8008AF9C;
extern u16 D_80073444;
extern void *D_80073438;
extern void *D_8007343C;
extern u8 D_80002BA8[];
extern u8 D_80002BB0[];

extern void *func_80032E00(s32, u32);
extern void func_80032F3C(s32, void *);
extern void func_800E2068(void *, void *, s32);
extern void func_800E2190(void *, void *, s32);

void audio_frame_storage_mode(u16 mode, s32 count)
{
    s32 saved_count = count;
    s16 saved_value = saved_count;

    D_8008AF9C = mode;
    if (mode == 1) {
        D_80073444 = saved_value;
        D_80073438 = func_80032E00(0, 0x1456);
        func_800E2068(D_80002BA8, D_80073438, (s16)saved_count);
        D_8007343C = func_80032E00(0, 0x3C0);
        func_800E2068(D_80002BB0, D_8007343C, (s16)saved_count);
    } else {
        if (D_80073438 != 0) {
            void *second;

            func_800E2190(D_80002BA8, D_80073438, (s16)saved_count);
            func_80032F3C(0, D_80073438);
            second = D_8007343C;
            D_80073438 = 0;
            func_800E2190(D_80002BB0, second, (s16)saved_count);
            func_80032F3C(0, D_8007343C);
            D_8007343C = 0;
        }
        D_80073444 = 2;
    }
}
