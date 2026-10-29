#include "types.h"

typedef struct Obj { u8 pad0[0xC]; s16 xC; } Obj;

s32 func_8002E7A0(s32, s32);

s32 func_800D75CC(Obj *arg0, s32 *arg1) {
    s32 a, b, d, t;

    a = arg1[0];
    if (a < 0) {
        a = -a;
    }
    b = arg1[1];
    if (b < 0) {
        b = -b;
    }
    if (a < b) {
        d = b + a / 2;
    } else {
        d = a + b / 2;
    }
    t = ((arg0->xC + 0x24) << 7) + 0x1A8F5;
    if (t / 256 != 0) {
        return func_8002E7A0(d, t * 50);
    }
    return 0;
}
