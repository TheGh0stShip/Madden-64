#include "types.h"

u16 func_8009B14C(const u8* bytes) {
    return bytes[0] | (bytes[1] << 8);
}
