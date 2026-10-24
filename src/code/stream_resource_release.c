#include "types.h"

extern void* D_800740C4;
extern s16 D_800740C8;
extern u8 D_80002E68;
extern void func_800E2190(void* command, void* resource, s32 mode);
extern void func_80032F3C(s32 pool, void* resource);

void func_8003EB78(void) {
    func_800E2190(&D_80002E68, D_800740C4, 1);
    func_80032F3C(0, D_800740C4);
    D_800740C4 = 0;
    D_800740C8 = 0;
}
