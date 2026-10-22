#include "types.h"

extern void func_80035CFC(u16 mode);
extern void func_80036540(s32 value);

void func_80035CD4(u16 mode) {
    func_80035CFC(mode);
    func_80036540(0);
}
