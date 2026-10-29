#include "types.h"

typedef u16 histcell;
typedef histcell hist1d[32];
typedef hist1d *hist2d;
typedef hist2d *hist3d;

typedef struct {
    u8 pad0[0x18];
    hist3d histogram;
} CQuantizer;

typedef struct {
    u8 pad0[0x1C8];
    CQuantizer *cquantize;
} JDecompress;

s32 func_80061B10(JDecompress *, s32, s32, s32, u8 *);
void func_80061D80(JDecompress *, s32, s32, s32, s32, u8 *, u8 *);

void func_80061F10(JDecompress *cinfo, s32 c0, s32 c1, s32 c2) {
    hist3d histogram = cinfo->cquantize->histogram;
    s32 minc0, minc1, minc2;
    s32 ic0, ic1, ic2;
    u8 *cptr;
    histcell *cachep;
    u8 colorlist[256];
    u8 bestcolor[128];
    s32 numcolors;

    c0 >>= 2;
    c1 >>= 3;
    c2 >>= 2;

    minc0 = (c0 << 5) + 4;
    minc1 = (c1 << 5) + 2;
    minc2 = (c2 << 5) + 4;

    numcolors = func_80061B10(cinfo, minc0, minc1, minc2, colorlist);
    func_80061D80(cinfo, minc0, minc1, minc2, numcolors, colorlist, bestcolor);

    c0 <<= 2;
    c1 <<= 3;
    c2 <<= 2;
    cptr = bestcolor;
    for (ic0 = 0; ic0 < 4; ic0++) {
        for (ic1 = 0; ic1 < 8; ic1++) {
            cachep = &histogram[c0 + ic0][c1 + ic1][c2];
            for (ic2 = 0; ic2 < 4; ic2++) {
                *cachep++ = (histcell)(*cptr++ + 1);
            }
        }
    }
}
