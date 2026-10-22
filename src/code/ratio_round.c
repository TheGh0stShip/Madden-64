#include "types.h"

s32 func_800600E0(s32 unused0, s32 unused1, s32 value, s32 scale) {
    return (value * 255 + scale / 2) / scale;
}
