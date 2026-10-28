#include "types.h"

extern void *CURRENT;
extern u8 RESOURCE;
extern u8 END;
void func_800DD514(void *resource);

s32 overlay5_resource_range_initialize(void) {
    CURRENT = &END;
    func_800DD514(&RESOURCE);
    return 25;
}
