#include "types.h"

#ifndef NULL
#define NULL 0
#endif

extern s32 *D_800893B8;
extern s32 D_800BB46C;

void func_800B03CC(void) {
    D_800893B8 = &D_800BB46C;
}
