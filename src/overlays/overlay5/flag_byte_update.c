#include "types.h"

void func_800E0928(u8* object, u8 mask, u8 merge) {
    if (merge != 0) {
        mask |= object[9];
    }
    object[9] = mask;
}
