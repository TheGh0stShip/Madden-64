#include "types.h"

extern void *TABLE[];
void func_8002E65C(void *value, void *pointer);

#ifndef SCALE
#define SCALE 1
#endif

#ifndef ELEMENT
#define ELEMENT 0
#endif

void overlay5_indexed_pointer_dispatch(u16 index, void *value) {
    func_8002E65C(value, TABLE[index * SCALE + ELEMENT]);
}
