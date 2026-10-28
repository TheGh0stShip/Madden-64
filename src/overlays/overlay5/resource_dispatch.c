#include "types.h"

void func_800DD514(void* resource);
extern u8 RESOURCE;

s32 overlay5_resource_dispatch(void) {
    func_800DD514(&RESOURCE);
    return 25;
}
