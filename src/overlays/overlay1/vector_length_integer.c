#include "types.h"

s16 func_800AB0FC(s16 x, s16 y) {
    s32 x_squared;
    s32 y_squared;
    u32 squared;
    s16 magnitude;

    if (x < 0) {
        x = -x;
    }
    if (y < 0) {
        y = -y;
    }

    x_squared = x * x;
    y_squared = y * y;
    squared = x_squared + y_squared;
    magnitude = 0;
    if (squared != 0) {
        do {
            magnitude++;
        } while ((u32)(magnitude * magnitude) < squared);
    }
    if ((u32)(x_squared + y_squared) < (u32)(magnitude * magnitude)) {
        magnitude--;
    }
    return magnitude;
}
