#include "types.h"

u16 func_80031A1C(s32 limit);

s32 overlay5_random_event_select(void) {
    s32 result;

    result = 0;
    switch (func_80031A1C(16)) {
        case 0: case 1: result = 17; break;
        case 2: case 3: result = 18; break;
        case 4: case 5: result = 19; break;
        case 6: case 7: result = 20; break;
        case 8: case 9: result = 15; break;
        case 10: case 11: result = 14; break;
        case 12: case 13: result = 16; break;
        case 14: case 15: result = 13; break;
    }
    return result;
}
