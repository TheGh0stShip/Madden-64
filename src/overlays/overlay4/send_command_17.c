#include "types.h"

extern s32 func_800E1BCC(void* object, u8* command);

s32 func_800CAFF0(void* object) {
    u8 command[1];

    command[0] = 0x17;
    return func_800E1BCC(object, command);
}
