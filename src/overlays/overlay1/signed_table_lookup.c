#include "types.h"

extern s16 D_80086DE8[];

s16 func_800AF5DC(s16 index) {
    return D_80086DE8[index * 4];
}
