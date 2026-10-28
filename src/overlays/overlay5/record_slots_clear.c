#include "types.h"

void func_800D67B8(s32* records) {
    u16 index;

    for (index = 0; index < 3; index++) {
        records[index] = 0;
        records[index + 3] = 0;
    }
    records[6] = 0;
}
