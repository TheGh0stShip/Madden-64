#include "types.h"

extern s32 D_80064BB0;
extern u8 D_80064BB8[];

u8* func_8000DF10(void) {
    return D_80064BB8 + D_80064BB0 * 120;
}
