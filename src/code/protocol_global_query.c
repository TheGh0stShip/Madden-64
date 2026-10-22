#include "types.h"

extern u8 D_80074A40[];
extern u8 D_80074A50[];
extern u16 func_80043538(void*, void*, void*, u16);

u16 func_80043648(void* value) {
    return func_80043538(D_80074A50, D_80074A40, value, 0xF13F);
}
