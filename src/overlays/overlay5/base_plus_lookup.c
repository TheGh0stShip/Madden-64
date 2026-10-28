#include "types.h"

u16 func_80031A1C(u16 index);

u8 *overlay5_base_plus_lookup(u8 *base, u16 index) {
    return base + func_80031A1C(index);
}
