#include "types.h"

void func_800E2438(void);
s16 func_800E2354(void);
void func_800E2480(void);

s32 overlay5_runtime_operation_run(void) {
    s32 result;

    func_800E2438();
    result = (s16)func_800E2354();
    func_800E2480();
    return result;
}
