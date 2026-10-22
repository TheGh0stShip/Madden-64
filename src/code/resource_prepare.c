#include "types.h"

extern void* func_800346DC(void*);
extern void func_80034804(void*, void*);

void* func_80034858(void* source) {
    void* resource = func_800346DC(source);

    func_80034804(resource, source);
    return resource;
}
