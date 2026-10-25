#include "types.h"

extern u8 D_8007E658[];
extern u8 D_8008B788[];
extern void func_8002E730(void);
extern void func_80046978(void);
extern void func_80045B98(void* thread, s32 id, void (*entry)(void),
                          void* argument, void* stack, s32 priority);
extern void func_8004DE18(void* thread);

void func_8002E6C8(void) {
    func_80046978();
    func_80045B98(D_8007E658, 1, func_8002E730, 0, D_8008B788, 10);
    func_8004DE18(D_8007E658);
    while (1) {
    }
}
