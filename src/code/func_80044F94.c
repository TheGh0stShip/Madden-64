#include "types.h"

typedef struct {
    s32 voiceA;
    s32 voiceB;
    u8 pad08[0x2C - 0x8];
} SoundChannel;

extern s32 D_8008A3E0;
extern u16 D_8007A9A4;
extern u16 D_800748FC[];
extern u16 D_80074904[];
extern SoundChannel D_8007A908[];
extern void func_800448C4(void);
extern void func_800447C4(u16 bank, u16 sound, u16 channel, s32 arg3);
extern void func_80044694(u16 bank, u16 sound, u16 channel);
extern void func_8004445C(u16 channel);
extern void func_80044530(s32 voice, u16 bank, u16 sound, u8 channel, u8 slot, s32 arg5);
extern void func_800420B0(u16 bank, s32 arg1);

void func_80044F94(u16 bank, u16 *sounds) {
    u16 i;
    struct {
        u16 bank;
        u8 pad02[0xE];
        s32 flags;
        u8 pad14[4];
    } request;

    D_8008A3E0 = 1;
    func_800448C4();
    request.bank = bank;
    request.flags = 0;
    D_8007A9A4 = bank;
    for (i = 0; i < 2; i++) {
        func_800447C4(D_8007A9A4, D_800748FC[i], i, 3);
        func_80044694(D_8007A9A4, D_80074904[i], i);
        func_8004445C(i);
        func_80044530(D_8007A908[i].voiceA, bank, sounds[i], i, i, 0);
        func_80044530(D_8007A908[i].voiceB, bank, sounds[i], i, i, 1);
    }
    func_800420B0(D_8007A9A4, 0);
}
