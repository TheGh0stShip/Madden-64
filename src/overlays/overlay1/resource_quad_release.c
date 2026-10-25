#include "types.h"

extern void func_80016FF4(void *resource);

void resource_quad_release(void **resources)
{
    func_80016FF4(resources[0]);
    func_80016FF4(resources[1]);
    func_80016FF4(resources[2]);
    func_80016FF4(resources[3]);
}
