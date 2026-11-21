#include "types.h"

typedef struct {
    u8 data[40];
} Palette;

typedef struct {
    u8 pad000[0x14C];
    u8 unk_14C;
    u8 pad14D;
    u16 unk_14E;
    u16 unk_150;
    u8 unk_152;
    u8 unk_153;
    Palette *unk_154;
    Palette *unk_158;
} Screen;

extern u16 D_800C5A60[];
extern u16 D_800C5B4A[];
extern s8 D_800C5B38[];
extern s8 D_800C5C22[];

Palette *func_8003AA28(u16);
void func_8001F25C(s32, s32, s32);
void func_8001F2B4(s32, Palette *);
void func_8001FA0C(void);

void func_800B9010(Screen *screen) {
    Palette *pal;
    s32 unused[2];

    screen->unk_14E = D_800C5A60[screen->unk_14C];
    screen->unk_150 = D_800C5B4A[screen->unk_14C];
    pal = func_8003AA28(screen->unk_14E);
    *screen->unk_154 = *pal;
    func_8001F25C(0, D_800C5B38[screen->unk_14C], 0);
    func_8001F2B4(0, pal);
    pal = func_8003AA28(screen->unk_150);
    *screen->unk_158 = *pal;
    func_8001F25C(1, D_800C5C22[screen->unk_14C], 0);
    func_8001F2B4(1, pal);
    func_8001FA0C();
    screen->unk_152 = D_800C5B38[screen->unk_14C];
    screen->unk_153 = D_800C5C22[screen->unk_14C];
}
