#include "types.h"

extern u16 func_80031A1C(s32 limit);

s32 func_800C63A8(s32 value) {
    s32 result = 0;

    if ((s16)value < 0x19) {
        switch (func_80031A1C(8)) {
            case 0:
                result = 0x12;
                break;
            case 1:
                result = 2;
                break;
            case 2:
                result = 3;
                break;
            case 3:
                result = 0x13;
                break;
            case 4:
                result = 0x14;
                break;
            case 5:
                result = 0xD;
                break;
            case 6:
                result = 0x10;
                break;
            case 7:
                result = 0x11;
                break;
        }
    } else {
        return 0x15;
    }
    return result;
}
