#include "types.h"

u8 *func_800B2E94(u8 *cursor) {
    while (*cursor != 0) {
        cursor++;
    }
    return cursor + 1;
}
