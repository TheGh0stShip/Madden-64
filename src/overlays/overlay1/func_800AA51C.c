#include "types.h"

void func_800A5D6C(s32 *dst, s32 *tmp, s32 value, s32 arg3, s32 arg4);

void func_800AA51C(s32 *dst, s32 *src, s32 arg2, s32 arg3) {
    s32 tmp;

    func_800A5D6C(&dst[0], &tmp, src[0], arg2, arg3);
    func_800A5D6C(&dst[1], &tmp, src[1], arg2, arg3);
    func_800A5D6C(&dst[2], &tmp, src[2], arg2, arg3);
}
