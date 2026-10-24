#include "types.h"

extern u32 D_80087F90[];
extern u32 D_80089358;

u32 func_80031C20(u32 value, s8 index) {
    u32 previous = D_80089358 & D_80087F90[index];

    D_80087F90[index] = value;
    return ~previous & value;
}
