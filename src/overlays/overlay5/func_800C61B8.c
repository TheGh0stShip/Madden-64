#include "types.h"

extern u16 func_80031A1C(s32 range);

s16 func_800C61B8(s16 arg0)
{
    s16 result = 0;

    if (arg0 < 6) {
        switch (func_80031A1C(10)) {
        case 0:
        case 1:
            result = 12;
            break;
        case 2:
        case 3:
            result = 11;
            break;
        case 4:
        case 5:
            result = 10;
            break;
        case 6:
            result = 15;
            break;
        case 7:
            result = 14;
            break;
        case 8:
        case 9:
            result = 0x800C;
            break;
        }
    } else if (arg0 < 18) {
        switch (func_80031A1C(14)) {
        case 0:
        case 1:
            result = 13;
            break;
        case 2:
        case 3:
        case 4:
            result = 15;
            break;
        case 5:
        case 6:
            result = 14;
            break;
        case 7:
        case 8:
            result = 16;
            break;
        case 9:
        case 10:
        case 11:
            if (func_80031A1C(100) < 50) {
                result = 20;
            } else {
                result = 19;
            }
            break;
        case 12:
        case 13:
            if (func_80031A1C(100) < 50) {
                result = 17;
            } else {
                result = 18;
            }
            break;
        }
    } else {
        switch (func_80031A1C(10)) {
        case 0:
        case 1:
            result = 17;
            break;
        case 2:
        case 3:
            result = 18;
            break;
        case 4:
        case 5:
        case 6:
            result = 19;
            break;
        case 7:
        case 8:
        case 9:
            result = 20;
            break;
        }
    }
    return result;
}
