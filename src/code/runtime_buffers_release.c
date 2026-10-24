#include "types.h"

extern void* D_8006BAC0;
extern void* D_8006BAC4;
extern void func_80032F3C(s32 pool, void* resource);

void func_80024E9C(void) {
    func_80032F3C(0, D_8006BAC0);
    func_80032F3C(0, D_8006BAC4);
    D_8006BAC0 = 0;
}
