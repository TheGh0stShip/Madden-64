#include "types.h"

extern s32 D_8006929C[];

s32 func_8001AEA8(s32 value) {
    s32 previous = D_8006929C[0];

    D_8006929C[0] = value;
    return previous;
}
