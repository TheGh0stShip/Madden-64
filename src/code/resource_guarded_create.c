#include "types.h"

extern u32 D_8007A500;
extern void func_80035D7C(u16);

void func_8003647C(u16 resource) {
    D_8007A500 = 1;
    func_80035D7C(resource);
    D_8007A500 = 0;
}
