#include "types.h"

void func_80033534(s32* entry) {
    entry[6] = -1;
    entry[5] = -1;
    entry[4] = -1;
    entry[3] = -1;
    entry[0] = -1;
    *(s16*)(entry + 2) = 0;
    entry[1] = 0;
}
