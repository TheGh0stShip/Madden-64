#include "types.h"

extern s16 func_80034A7C(u16 index);
extern s16 func_80034B10(void);
extern s16 func_80034BB8(void);

s16 func_80034CB4(u16 index, s32 mode) {
    s16 value;

    switch (mode) {
        case 0:
            value = func_80034A7C(index);
            break;
        case 1:
            value = func_80034B10();
            break;
        case 2:
            value = func_80034BB8();
            break;
    }
    return value;
}
