#include "types.h"

extern void* D_8007AB10;
extern void* D_8007AB14;
extern void* D_8007AB1C;
extern void* D_8007AB20;
extern void func_80032F3C(s32, void*);

void func_80045794(void) {
    func_80032F3C(0, D_8007AB10);
    func_80032F3C(0, D_8007AB14);
    func_80032F3C(0, D_8007AB1C);
    func_80032F3C(0, D_8007AB20);
}
