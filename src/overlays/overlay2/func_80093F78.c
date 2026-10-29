#include "types.h"

u8 *func_8008DC10(s16, s16);

s32 func_80093F78(s16 a, s16 b, s16 value) {
    u8 *slot = func_8008DC10(a, b);

    if (slot[0] == value || slot[1] == value) {
        return 1;
    }
    return 0;
}
