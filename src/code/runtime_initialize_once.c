#include "types.h"

extern u32 D_8006BAC0;
extern void func_80024694(void);

s32 func_80037258(void) {
    if (D_8006BAC0 == 0) {
        func_80024694();
        return 1;
    }
    return 0;
}
