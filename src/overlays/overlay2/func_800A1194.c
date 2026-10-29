#include "types.h"

typedef struct {
    s32 unk00;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    s32 unk10;
    u8 pad14[0x348];
    s32 unk35C;
} Screen;

extern s16 D_80072670[];
extern s16 D_80072650[];

void func_800D6424(s32, s32, s32, s32);
void func_800DD658(void);
void func_800A1364(Screen *, s32);
void func_800A1658(s32, Screen *, s32, s32);
void func_800DF6EC(void);

void func_800A1194(Screen *screen, s32 arg1, s32 from, s32 to) {
    s32 x0 = D_80072670[from];
    s32 x1 = D_80072670[to];
    s32 y0 = D_80072650[from];
    s32 y1 = D_80072650[to];
    u8 xdir = (x0 >= x1) ? 3 : 2;
    u8 ydir = (y0 >= y1);

    func_800D6424(screen->unk00, y1, ydir, 0xF);
    func_800D6424(screen->unk08, y1, ydir, 0xF);
    func_800D6424(screen->unk04, y1 + 0x227, ydir, 0xF);
    func_800D6424(screen->unk0C, y1 + 0x227, ydir, 0xF);
    func_800D6424(screen->unk10, y1 + 0x11E, ydir, 0xF);
    func_800D6424(screen->unk00, x1, xdir, 0xF);
    func_800D6424(screen->unk08, x1 + 0x8C, xdir, 0xF);
    func_800D6424(screen->unk04, x1 - 3, xdir, 0xF);
    func_800D6424(screen->unk0C, x1 + 0x87, xdir, 0xF);
    func_800D6424(screen->unk10, x1 + 0x50, xdir, 0xF);
    func_800DD658();
    if (screen->unk35C == 0) {
        func_800A1364(screen, arg1);
    }
    func_800A1658(arg1, screen, from, to);
    func_800DF6EC();
}
