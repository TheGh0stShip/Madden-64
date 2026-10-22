#include "types.h"

extern u8* D_80073434;

u8* func_8003A7B8(u16 index) {
    return D_80073434 + index * 217;
}
