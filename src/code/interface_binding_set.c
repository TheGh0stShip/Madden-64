#include "types.h"

extern s16 D_8007A548;
extern void* D_800740D0;
extern s32 func_800356C4(void*, void*);

void func_8004150C(void* callback, void* first, void* second) {
    D_8007A548 = func_800356C4(first, second);
    D_800740D0 = callback;
}
