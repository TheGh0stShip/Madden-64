#include "types.h"

typedef struct {
    u32 w0;
    u32 w1;
} Gfx;

extern void func_8000E490(Gfx **dl, Gfx *cmdA, Gfx *cmdB);

void func_8000E7F4(Gfx **dl) {
    Gfx a;
    Gfx b;
    Gfx *pa;
    Gfx *pb;

    pa = &a;
    pb = &b;

    pa->w0 = 0xB900031D;
    pa->w1 = 0x442078;
    pb->w0 = 0xB900031D;
    pb->w1 = 0xC8112078;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xB900031D;
    pa->w1 = 0x443078;
    pb->w0 = 0xB900031D;
    pb->w1 = 0xC8113078;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xFC61FEC3;
    pa->w1 = 0x55FE7F3F;
    pb->w0 = 0xFC61FFFF;
    pb->w1 = 0x5FFE7E38;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xFC60FEC1;
    pa->w1 = 0x55FE793C;
    pb->w0 = 0xFC60FFFF;
    pb->w1 = 0x5FFE7838;
    func_8000E490(dl, pa, pb);
    pa->w0 = 0xFC60FEC1;
    pa->w1 = 0x55FE7339;
    pb->w0 = 0xFC60FFFF;
    pb->w1 = 0x5FFE7238;
    func_8000E490(dl, pa, pb);
}
