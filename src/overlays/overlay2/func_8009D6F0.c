#include "types.h"

extern u8 D_800C4AD4[];

u8 *func_8009D6F0(s32 index) {
    return D_800C4AD4 + index * 13;
}
