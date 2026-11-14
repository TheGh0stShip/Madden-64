#include "types.h"

typedef struct Values800A10FC {
    u32 value0;
    u32 value4;
    u32 value8;
    u32 valueC;
    u32 value10;
    u32 current0;
    u32 current1;
    u32 previous0;
    u32 previous1;
} Values800A10FC;

void func_800A10FC(Values800A10FC *values, u32 mode) {
    values->previous0 = values->current0;
    values->previous1 = values->current1;

    switch (mode) {
    case 0:
    case 1:
    case 8:
        values->current1 = 0;
        values->current0 = values->value0;
        break;
    case 2:
    case 3:
    case 9:
        values->current1 = 0;
        values->current0 = values->value8;
        break;
    case 4:
    case 5:
    case 10:
        values->current1 = 0;
        values->current0 = values->value4;
        break;
    case 6:
    case 7:
    case 11:
        values->current1 = 0;
        values->current0 = values->valueC;
        break;
    case 12:
        values->current0 = values->value0;
        values->current1 = values->value8;
        break;
    case 13:
        values->current0 = values->value4;
        values->current1 = values->valueC;
        break;
    case 14:
        values->current1 = 0;
        values->current0 = values->value10;
        break;
    }
}
