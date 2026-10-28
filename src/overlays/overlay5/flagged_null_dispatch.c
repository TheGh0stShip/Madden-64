#include "types.h"

extern u8 FLAG;
void func_800DD514(void *resource);

void overlay5_flagged_null_dispatch(void) {
    FLAG = 1;
    func_800DD514(0);
}
