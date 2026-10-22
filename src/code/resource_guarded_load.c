#include "types.h"

extern u32 D_8007A500;
extern void func_80035EF0(u16);

void func_800364B0(u16 resource) {
    D_8007A500 = 1;
    func_80035EF0(resource);
    D_8007A500 = 0;
}
