#include "types.h"

extern f64 D_80001590;
extern f64 D_80001598;
float sqrtf(float);

s32 func_8002E99C(s32 value) {
    f64 d;

    if (value <= 0) {
        return 0;
    }
    d = value;
    d *= D_80001590;
    d = sqrtf(d);
    return d * D_80001598;
}
