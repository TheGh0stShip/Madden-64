#include "types.h"

extern s16 D_800724F0;

void func_8003555C(u16 mode) {
    switch (mode) {
        case 0:
            D_800724F0 = 0;
            break;
        case 1:
            D_800724F0 = 1;
            break;
    }
}
