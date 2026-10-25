#include "types.h"

extern s16 D_800876DC;
extern s16 D_80087AAC;
extern void func_800AD54C(void);

void conditional_runtime_cleanup(void)
{
    if ((D_800876DC != 2 && D_800876DC != 4) || D_80087AAC >= 0x79) {
        func_800AD54C();
    }
}
