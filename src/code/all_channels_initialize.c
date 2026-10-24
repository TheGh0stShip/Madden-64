#include "types.h"

extern void func_80041EF8(u32 channel);

void func_80041EBC(void) {
    u32 channel;

    for (channel = 0; channel < 32; channel++) {
        func_80041EF8(channel);
    }
}
