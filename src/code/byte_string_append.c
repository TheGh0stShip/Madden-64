#include "types.h"

u8 *func_8002E688(u8 *destination, const u8 *source) {
    u8 *result = destination;

    while (*destination != 0) {
        destination++;
    }
    while ((*destination++ = *source++) != 0) {
    }

    return result;
}
