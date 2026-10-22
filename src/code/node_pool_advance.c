#include "types.h"

extern u8* D_80078438;

void* func_8000DE18(void) {
    u8* node = D_80078438;

    D_80078438 = node + 16;
    return node;
}
