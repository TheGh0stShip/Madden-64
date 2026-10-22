#include "types.h"

extern u16 func_800349FC(void* object, void* output);

s32 func_80035380(void* object) {
    u32 output;
    u16 status = func_800349FC(object, &output);

    return status == 2 || status == 0;
}
