#include "types.h"

#ifndef NULL
#define NULL 0
#endif

s32 func_8000D834(s32, s32);                    /* extern */
s32 func_8000D874(s32, s32);                    /* extern */
extern s32 D_80071C4C;
extern s32 D_80087AA8;
extern s32 D_8008931C;

void func_80094080(void) {
    if (D_80071C4C != 0) {
        func_8000D874(D_80087AA8, D_80071C4C);
        func_8000D834(D_8008931C, D_80071C4C);
        D_80071C4C = 0;
    }
}
