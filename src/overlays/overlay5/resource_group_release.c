#include "types.h"

void func_8001EC20(void *resource, s32 id);

void overlay5_resource_group_release(void *resource) {
    func_8001EC20(resource, 0x39);
    func_8001EC20(resource, 0x40);
    func_8001EC20(resource, 0x47);
    func_8001EC20(resource, 0x48);
    func_8001EC20(resource, 0x49);
    func_8001EC20(resource, 0x4A);
}
