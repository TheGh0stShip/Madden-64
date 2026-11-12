#include "types.h"

extern s16 D_80084F6C;

s16 func_800E1588(s32 index);

void func_800E1420(s32 current) {
    s16 original = current;
    s32 initial_limit = 4;

    do {
        D_80084F6C = current + 1;
        if (D_80084F6C == initial_limit) {
            D_80084F6C = 0;
        }
    } while (0);
    while (func_800E1588(D_80084F6C) != 0) {
        if (D_80084F6C == original) {
            break;
        }
        D_80084F6C++;
        if (D_80084F6C == 4) {
            D_80084F6C = 0;
        }
    }
}
