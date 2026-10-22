#include "types.h"

extern u32* D_80084F5C;
extern u32 D_80088A74;
extern u32 D_80088A78;

void func_8000B008(u32 flags) {
    u32* state = &D_80088A78;

    if ((*state & flags) != 0) {
        u32* command = D_80084F5C;
        u32 keep = ~flags;

        D_80084F5C = command + 2;
        command[0] = 0xB6000000;
        command[1] = flags;
        *state &= keep;
        D_80088A74 &= keep;
    }
}
