#include "types.h"

void func_800E1F84(s8 index);

void overlay5_runtime_slots_initialize(void) {
    s8 index;

    index = 0;
    do {
        func_800E1F84(index);
        index++;
    } while (index <= 0);
}
