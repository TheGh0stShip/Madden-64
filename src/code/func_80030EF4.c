#include "types.h"

void func_80031040(s16, s8 *, s8 *);
void func_8003112C(s8 *, s8 *);

void func_80030EF4(s16 arg0, s8 *arg1, s8 *arg2) {
    s8 v[2];
    s8 x;

    if (arg0 < 0) {
        func_8003112C(&v[0], &v[1]);
    } else {
        func_80031040(arg0, &v[0], &v[1]);
    }
    x = v[0] >> 2;
    v[0] = x;
    v[1] = (s8)-v[1] >> 2;
    if (x < 0) {
        v[0] = x + 2;
        if (v[0] > 0) {
            v[0] = 0;
        }
    } else {
        v[0] = x - 2;
        if (v[0] < 0) {
            v[0] = 0;
        }
    }
    v[0] += 0x10;
    if (v[0] < 0) {
        v[0] = 0;
    }
    if (v[0] >= 0x20) {
        v[0] = 0x1F;
    }
    if (v[1] < 0) {
        v[1] += 2;
        if (v[1] > 0) {
            v[1] = 0;
        }
    } else {
        v[1] -= 2;
        if (v[1] < 0) {
            v[1] = 0;
        }
    }
    v[1] += 0x10;
    if (v[1] < 0) {
        v[1] = 0;
    }
    if (v[1] >= 0x20) {
        v[1] = 0x1F;
    }
    *arg1 = v[0];
    *arg2 = v[1];
}
