#include "types.h"

s32 func_800199A0(u16 type) {
    switch (type) {
        case 4:
        case 11:
            return 1;
        case 7:
        case 12:
        case 13:
        case 15:
        case 16:
            return 2;
        default:
            return 0;
    }
}
