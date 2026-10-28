#include "types.h"

#ifndef FLAG_VALUE
#define FLAG_VALUE 0
#endif

extern u8 FLAG;
extern u8 RESOURCE;
void func_800DD514(void* resource);

s32 overlay5_flagged_resource_dispatch(void) {
    FLAG = FLAG_VALUE;
    func_800DD514(&RESOURCE);
    return 25;
}
