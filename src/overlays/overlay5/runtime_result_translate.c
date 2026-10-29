#include "types.h"

extern s16 D_80084F6C;

void func_800E2480(void);
s16 func_80030EA0(s32 index);
s32 func_800315C8(s32 value);
void func_800E2438(void);

s32 overlay5_runtime_result_translate(s32 result) {
    s32 translated;
    s16 value;

    switch (result) {
        case 0:
            return 0;
        case 1:
            return 5;
        case 10:
            translated = 3;
            func_800E2480();
            value = func_80030EA0(D_80084F6C);
            if (value != -1) {
                if (func_800315C8(value) & 1) {
                    translated = 5;
                }
            }
            func_800E2438();
            return translated;
        case 7:
        case 8:
            return 4;
        default:
            return 2;
    }
}
