#include "types.h"

extern u16 D_8006B9D8;
extern void* D_8006B9DC;
extern u16 D_800855D4;
extern u8 D_8000105C;
extern void func_800E2190(void* command, void* block, s32 mode);

void func_80024FD8(void) {
    if (D_8006B9D8 != 0 && D_800855D4 == 1) {
        func_800E2190(&D_8000105C, D_8006B9DC, 1);
    }
}
