#include "types.h"

s16 func_800E154C(s16);
void func_80094080(void);
void func_80092B98(void);
s16 func_800ACFA4(s16);
void func_80094028(void);
void func_800E1F28(void);
s16 func_800E1588(s16);

s16 func_800ACEC0(s16 slot) {
    s16 result;

    result = func_800E154C(slot);
    if (result == 3) {
        func_80094080();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        func_80092B98();
        if (func_800ACFA4(slot) == 0) {
            func_80094028();
            func_80092B98();
            func_80092B98();
            func_800E1F28();
            result = func_800E1588(slot);
            func_80094080();
            func_80092B98();
            func_80092B98();
            func_80092B98();
            func_80092B98();
        }
    }
    return result;
}
