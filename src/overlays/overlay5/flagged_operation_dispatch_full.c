#include "types.h"

s32 func_800D416C(
    s32 flags,
    s16 value,
    s32 first,
    s32 second,
    s32 third,
    s32 fourth,
    s32 fifth
);
s32 func_800D4548(
    s32 flags,
    s16 value,
    s32 first,
    s32 second,
    s32 third,
    s32 fourth,
    s32 fifth
);

s32 overlay5_flagged_operation_dispatch_full(
    s32 flags,
    s16 value,
    s32 first,
    s32 second,
    s32 third,
    s32 fourth,
    s32 fifth
) {
    s32 result = 0;

    if (flags & 1) {
        result = func_800D416C(flags, value, first, second, third, fourth, fifth);
    }
    if (flags & 6) {
        result = func_800D4548(flags, value, first, second, third, fourth, fifth);
    }
    return result;
}
