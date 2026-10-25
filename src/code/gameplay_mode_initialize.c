#include "types.h"

extern u32 D_80080C10;
extern void func_800B7DD8(s32 first, s32 mode, s32 third, s32 fourth,
                          s32 fifth);
extern void func_800213E4(void);

void func_80020938(void) {
    func_800B7DD8(1, 17, 0, 0, 0);
    D_80080C10 &= 0xFFEFFFFF;
    func_800213E4();
}
