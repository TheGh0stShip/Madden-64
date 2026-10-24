#include "types.h"

extern volatile s32 D_80071308;

s32 func_80036540(s32 wait) {
    if (wait == 0) {
        while (D_80071308 != 0) {
        }
        return 0;
    }

    return D_80071308;
}
