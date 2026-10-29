#include "types.h"

#ifndef RESOURCE_OFFSET
#define RESOURCE_OFFSET 0x7C
#endif

extern u8 *D_80072380;

void func_8001EC20(void *resource, s32 release_children);

void overlay5_resource_optional_release(void) {
    void *resource;

    resource = *(void **)(D_80072380 + RESOURCE_OFFSET);
    if (resource != 0) {
        func_8001EC20(resource, 1);
    }
}
