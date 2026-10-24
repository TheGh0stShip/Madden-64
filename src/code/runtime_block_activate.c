#include "types.h"

extern u16 D_8006B9D8;
extern void* D_8006B9DC;
extern u16 D_800855D4;
extern u8 D_8000105C;
extern void func_800E2068(void* command, void* block, s32 mode);

void func_80025028(void) {
    if (D_8006B9D8 != 0) {
        func_800E2068(&D_8000105C, D_8006B9DC, 1);
        D_800855D4 = 0;
    }
}
