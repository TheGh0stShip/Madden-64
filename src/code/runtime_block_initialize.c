#include "types.h"

extern void* D_8006B9DC;
extern void func_80033308(s32, void*, s32, s32);
extern void func_8002506C(void);

void func_80025114(void) {
    func_80033308(0, D_8006B9DC, 0x5C08, 0);
    func_8002506C();
}
