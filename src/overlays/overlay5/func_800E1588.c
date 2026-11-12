#include "types.h"

extern u8 D_800880D0[];
extern s32 func_80030EA0(s16 index);
extern s32 func_800315C8(s32 value);
extern void func_800E2438(void);
extern void func_8004AFD8(void *source, void *destination);
extern s32 func_800E2354(void);
extern void func_800E2480(void);

s16 func_800E1588(s16 index) {
    s16 original = index;
    u8 masks[4] = { 1, 2, 4, 8 };
    u8 value;
    s32 result = 5;
    s32 found;

    found = (s16)func_80030EA0(index);
    if (found != -1) {
        if ((func_800315C8(found) & 1) == 0) {
            func_800E2438();
            func_8004AFD8(D_800880D0, &value);
            result = -((value & masks[original]) == 0) & 5;
        } else {
            func_800E2438();
            result = func_800E2354();
            if ((s16)result != 2) {
                result &= -((s16)result != 4);
            } else {
                result = 5;
            }
        }
        func_800E2480();
    }
    return result;
}
