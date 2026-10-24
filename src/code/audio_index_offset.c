#include "types.h"

extern s16 D_80087A68;
extern u16 D_80087A92;

u16 func_8003DDA4(void) {
    if (D_80087A68 == 4) {
        return D_80087A92 + 41;
    }
    if (D_80087A68 == 3) {
        return D_80087A92 + 82;
    }
    return D_80087A92;
}
