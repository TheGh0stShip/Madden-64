#include "types.h"

extern void func_80036D84(s16 channel);

void func_80036D38(void) {
    s16 channel;

    for (channel = 0; channel < 15; channel++) {
        func_80036D84(channel);
    }
}
