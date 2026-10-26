#include "types.h"

extern s16 D_80087A80;
extern s16 D_80087AAC;
extern u16 D_800880C4;
extern s16 D_800876DC;
extern u8 *D_8008A744;
extern s16 D_800886E0;
extern u8 D_80082D96[];
extern s8 D_8008AFB8;
extern u32 D_80080C10;
extern void func_8009E0CC(void);
extern void func_8009BCB0(void);
extern void func_8009BD04(s32 value);
extern void func_8009C900(s32 first, s32 second);

void game_mode_initialize(void)
{
    s32 mode;
    u8 index;

    D_80087A80 = 0;
    func_8009E0CC();
    if (D_80087AAC >= 31) goto done;
    if (D_800880C4 & 4) goto done;
    mode = D_800876DC;
    if (mode == 2 || mode == 4) goto valid_mode;
    if (mode != 5) goto done;
valid_mode:
    index = D_8008A744[0x1E];
    if (index != D_800886E0) goto done;
    if (*(u16 *)(D_80082D96 + index * 0x214C) != 0) goto done;
    if (D_8008AFB8 != 1) goto done;
    func_8009BCB0();
    func_8009BD04(2);
    D_80080C10 &= 0xFFEFFFFF;
done:
    func_8009C900(0x19, 2);
}
