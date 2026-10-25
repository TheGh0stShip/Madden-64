#include "types.h"

extern void func_80016FE4(void *resource);

void indexed_resource_release(void **resources, u8 index)
{
    func_80016FE4(resources[0]);
    func_80016FE4(resources[1]);
    func_80016FE4(resources[index]);
}
