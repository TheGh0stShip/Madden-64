#include "types.h"

typedef struct AudioValuePair {
    u32 current;
    volatile u32 target;
} AudioValuePair;

extern s32 D_800734F8;
extern u32 D_80073504;
extern AudioValuePair* D_80087B6C;

void func_8003CB4C(u16 value) {
    D_80073504 = value;
    if (D_800734F8 != -1) {
        D_80087B6C->target = value;
        D_80087B6C->current = D_80087B6C->target;
    }
}
