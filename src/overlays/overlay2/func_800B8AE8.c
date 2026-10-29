#include "types.h"

typedef struct {
    u8 pad00[0x2C];
    s32 unk2C;
    s32 unk30;
    u8 pad34[0x10];
    s32 unk44;
    s32 unk48;
} Screen;

extern s32 D_800C5080;

void func_800D5D28(void);
Screen *func_800DD634(void);
void func_80032F3C(s32, s32);

void func_800B8AE8(void) {
    Screen *screen;

    func_800D5D28();
    screen = func_800DD634();
    screen->unk44 = 0;
    screen->unk48 = 0;
    screen->unk2C = 0;
    screen->unk30 = 0;
    func_80032F3C(0, D_800C5080);
}
