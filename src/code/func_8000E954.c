#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

extern void func_8000E490(Gfx **dl, Gfx *cmdA, Gfx *cmdB);

void func_8000E954(Gfx **dl) {
    Gfx a;
    Gfx b;
    Gfx *pa;
    Gfx *pb;

    pa = &a;
    pb = &b;

    pa->w0 = 0xB900031D;
    pa->w1 = 0xC8112078;
    pb->w0 = 0xB900031D;
    pb->w1 = 0x442078;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xB900031D;
    pa->w1 = 0xC8113078;
    pb->w0 = 0xB900031D;
    pb->w1 = 0x443078;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xFC61FFFF;
    pa->w1 = 0x5FFE7E38;
    pb->w0 = 0xFC61FEC3;
    pb->w1 = 0x55FE7F3F;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xFC60FFFF;
    pa->w1 = 0x5FFE7838;
    pb->w0 = 0xFC60FEC1;
    pb->w1 = 0x55FE793C;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xFC60FFFF;
    pa->w1 = 0x5FFE7238;
    pb->w0 = 0xFC60FEC1;
    pb->w1 = 0x55FE7339;
    func_8000E490(dl, pa, pb);
}
