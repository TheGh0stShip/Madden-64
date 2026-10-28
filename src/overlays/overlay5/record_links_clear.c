#include "types.h"

void func_800DE6E8(s32* records) {
    u16 index;

    for (index = 0; index < 3; index++) {
        records[index + 2] = 0;
        records[index + 5] = 0;
    }
}
