#include "types.h"

typedef struct {
    s32 voiceA;
    s32 voiceB;
    u8 pad08[0x2C - 0x8];
} SoundChannel;

extern s32 D_8008A3E0;
extern s32 D_8007A9B0;
extern u16 D_8007A9A4;
extern u16 D_800748FC[];
extern u16 D_80074904[];
extern SoundChannel D_8007A908[];
extern u32 D_8007A558[];
extern u32 D_8007A998[];
extern void func_800448C4(void);
extern void color_tables_refresh(void);
extern s32 resource_tnmf_resolve(void *key);
extern void grid_handles_build(u16 bank, u16 sound, u16 channel, u16 index);
extern void grid_row_handles_build(u16 bank, u16 sound, u16 channel);
extern void func_8004445C(u16 channel);
extern void func_80044530(s32 voice, u16 bank, u16 sound, u8 channel, u8 slot, s32 arg5);
extern void func_800420B0(u16 bank, s32 arg1);
extern void func_8004291C(void);
extern u32 memory_pool_range_take(s32 pool, u32 size);

void scheduler_queue_update(u16 bank, s32 mode, u16 *sounds, u16 *channels)
{
    u32 i;
    u32 j;
    struct {
        u16 bank;
        u16 type;
        u8 pad04[0xC];
        s32 flags;
        u8 pad14[4];
    } request;

    func_800448C4();
    D_8008A3E0 = mode;
    color_tables_refresh();
    request.bank = bank;
    request.flags = 0;
    request.type = 6;
    D_8007A9B0 = resource_tnmf_resolve(&request);
    D_8007A9A4 = bank;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            grid_handles_build(D_8007A9A4, D_800748FC[i], i, j);
        }
        grid_row_handles_build(D_8007A9A4, D_80074904[i], i);
        func_8004445C(i);
        func_80044530(D_8007A908[i].voiceA, bank, sounds[i], channels[i], i, 0);
        func_80044530(D_8007A908[i].voiceB, bank, sounds[i], channels[i], i, 1);
    }
    func_800420B0(bank, 0x1C);
    func_8004291C();
    D_8007A558[0] = memory_pool_range_take(0, 0xC480);
    D_8007A558[1] = D_8007A558[0] + 0x6240;
    D_8007A998[0] = memory_pool_range_take(0, 0x3120);
    D_8007A998[1] = D_8007A998[0] + 0x1890;
}
