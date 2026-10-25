#include "types.h"

extern u16 func_80031A1C(u16 maximum);
extern void func_80041C48(u16 index);

s32 func_80041CCC(u16 index, u16 threshold) {
    if (func_80031A1C(100) < threshold) {
        func_80041C48(index);
        return 1;
    }
    return 0;
}
