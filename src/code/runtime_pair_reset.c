#include "types.h"

extern void func_80015FD0(s16 index);

void func_80016054(void) {
    s16 index;

    for (index = 0; index < 2; index++) {
        func_80015FD0(index);
    }
}
