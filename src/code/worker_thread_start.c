#include "types.h"

extern u8 D_800808C8[];
extern u8 D_80080810[];
extern void func_8002EA60(void* argument);
extern void func_80045B98(void* thread, s32 id, void (*entry)(void*),
                          void* argument, void* stack, s32 priority);
extern void func_8004DE18(void* thread);
extern void func_8004D218(void* thread, s32 priority);

void func_8002E730(void) {
    func_80045B98(D_800808C8, 3, func_8002EA60, 0, D_80080810, 10);
    func_8004DE18(D_800808C8);
    func_8004D218(0, 0);
    for (;;) {
    }
}
