#include "types.h"

u16 func_800BA0C8(s32 first, s32 second, s32 count);
u16 func_800BA6DC(s32 first, s32 second, s32 count);
u16 func_800B9D38(s32 first, s32 second, s32 count);

u16 func_800BE3FC(s32 first, s32 second) {
    return func_800BA0C8(first, second, 6);
}

u16 func_800BE41C(s32 first, s32 second) {
    return func_800BA6DC(first, second, 6);
}

u16 func_800BE43C(s32 first, s32 second) {
    return func_800B9D38(first, second, 0x12);
}
