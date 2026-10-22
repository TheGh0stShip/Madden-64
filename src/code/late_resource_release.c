#include "types.h"

extern void* D_80074D78;
void func_80032F3C(s32 pool, void* resource);

void func_800458F8(void) {
    func_80032F3C(0, D_80074D78);
    D_80074D78 = 0;
}
