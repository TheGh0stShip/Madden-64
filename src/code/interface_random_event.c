#include "types.h"

extern u16 func_80031A1C(u16);
extern void func_8003CF78(s16, s16);

void func_8004178C(void) {
    func_8003CF78(func_80031A1C(7) + 12, 9);
}
