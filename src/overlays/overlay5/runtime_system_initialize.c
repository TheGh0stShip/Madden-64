#include "types.h"

extern u8 D_800880D0[];

void func_80032A80(void);
void func_80032A4C(void *system, s32 mode);
void func_8004CDA8(void *system, s32 mode, s32 flags);

void overlay5_runtime_system_initialize(void) {
    func_80032A80();
    func_80032A4C(D_800880D0, 0);
    func_8004CDA8(D_800880D0, 0, 0);
}
