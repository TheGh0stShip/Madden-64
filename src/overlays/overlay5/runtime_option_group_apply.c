#include "types.h"

#ifndef OPTION_MODE
#define OPTION_MODE 0
#endif

extern s8 D_80084FA8;
extern u8 D_800E71D0[];

void func_80022BC0(s32 enabled, s32 selection);
void func_800DFAF8(void *object, void *option, s32 mode);

void overlay5_runtime_option_group_apply(void *object) {
    u8 *options;

    func_80022BC0(!OPTION_MODE, D_80084FA8);
    options = D_800E71D0;
    func_800DFAF8(object, options, OPTION_MODE);
    func_800DFAF8(object, options + 0x10, OPTION_MODE);
    func_800DFAF8(object, options + 0x20, OPTION_MODE);
    func_800DFAF8(object, options + 0x30, OPTION_MODE);
    func_800DFAF8(object, options + 0x40, OPTION_MODE);
}
