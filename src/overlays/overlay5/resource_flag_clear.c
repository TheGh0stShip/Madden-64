#include "types.h"

extern u16 FLAGS;
void func_800DF72C(void);
void func_800DD4B8(void);

s32 overlay5_resource_flag_clear(void) {
    u16 *flags;

    func_800DF72C();
    flags = &FLAGS;
    *flags &= ~8;
    func_800DD4B8();
    return 25;
}
