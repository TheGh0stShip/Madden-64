#include "types.h"

extern u16 func_80031964(void);

u16 func_80031A1C(u16 scale) {
    return ((u32)func_80031964() * scale) >> 16;
}
