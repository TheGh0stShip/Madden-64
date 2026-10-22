#include "types.h"

extern u32 D_8007A500;
extern void func_80036268(u16);

void func_800363F4(u16 resource) {
    D_8007A500 = 1;
    func_80036268(resource);
    D_8007A500 = 0;
}
