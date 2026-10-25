#include "types.h"

extern void func_800C2210(s32 row, s32 column, void *context);

void grid_callbacks_apply(void *context)
{
    s32 row;
    s32 column;

    for (row = 0; row < 2; row++) {
        for (column = 0; column < 55; column++) {
            func_800C2210(row, column, context);
        }
    }
}
