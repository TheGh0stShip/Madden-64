#include "types.h"

void func_800DD514(void* resource);
extern u8 RESOURCE;

s32 func_800AD794(void) {
    func_800DD514(&RESOURCE);
    return 25;
}
