#include "types.h"

extern u16 D_8006B9D8;
extern u16 D_8006B9DA;

s32 func_8002B5EC(void) {
    s32 mode;
    s32 expected;

    mode = D_8006B9D8;
    expected = 2;
    if (mode != expected) {
        if (mode != 0) {
            return 0;
        }
        if (D_8006B9DA != expected) {
            return 0;
        }
    }
    return 1;
}
