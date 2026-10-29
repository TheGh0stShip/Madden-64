#include "types.h"

extern void *D_80086DD8;
extern u8 D_800908B8;
extern s8 D_80087AF2;
extern u8 D_80086E30;
extern s32 D_800721D4;
extern s32 D_800721D0;
extern u16 D_800E7A74;
extern void *D_800E7A78[];
extern s16 D_800E7B7C;
extern void *D_800E7B80[];
extern void *D_8008931C;

u8 *func_800DD634(void);
void func_80035A7C(u16 value);
void func_8000D834(void *owner, void *resource);
void func_80032F3C(s32 pool, void *memory);
void func_8002FF70(void *object);

void overlay5_runtime_resource_arrays_clear(void) {
    u8 *entries;
    void *resource;
    s16 index;

    if ((D_80086DD8 == &D_800908B8) || (D_80087AF2 == 1)) {
        entries = func_800DD634();
    } else {
        entries = &D_80086E30;
    }
    if (D_800721D4 != 0) {
        func_80035A7C(D_800E7A74);
    }
    D_800721D0 = 0;
    for (index = 0; index < D_800E7B7C; index++) {
        resource = *(void **)(entries + (index * 8) + 0x44);
        if (resource != 0) {
            func_8000D834(D_8008931C, resource);
        }
        func_80032F3C(0, D_800E7A78[index]);
        D_800E7A78[index] = 0;
        func_8002FF70(D_800E7B80[index]);
    }
    D_800E7B7C = 0;
}
