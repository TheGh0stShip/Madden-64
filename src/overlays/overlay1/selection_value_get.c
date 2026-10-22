#include "types.h"

u16 func_800B2D80(void) {
    if (*(u16*)0x80087914 == 1) {
        return 0xFFFF;
    }
    return *(u16*)0x80089510;
}
