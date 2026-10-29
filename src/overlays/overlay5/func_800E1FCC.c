#include "types.h"

extern void* D_80084F28;
extern u8 D_80002ED8[];
extern u8 D_80002EE0[];
extern void func_800E1F84(s32 value);
extern void* func_80032E00(s32 value, void* data);
extern void func_8002E58C(void* object, s32 value, void* data);
extern void func_800E2584(void* object, void* descriptor, void* data);

void func_800E1FCC(void* state, s32 enabled) {
    void* data;
    void** global;

    if ((s16)enabled != 0) {
        return;
    }
    func_800E1F84(0);
    data = (u8*)state + 0xC;
    global = &D_80084F28;
    *global = func_80032E00(0, data);
    func_8002E58C(*global, 0, data);
    func_800E2584(*global, D_80002ED8, data);
    func_800E2584((u8*)*global + 0xC, D_80002EE0, state);
}
