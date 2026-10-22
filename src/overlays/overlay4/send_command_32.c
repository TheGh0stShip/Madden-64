#include "types.h"

extern s32 func_800E1BCC(void* object, u8* command);

s32 func_800CAFC4(void* object, s32 value) {
    u8 command[2];

    command[0] = 0x32;
    command[1] = value;
    return func_800E1BCC(object, command);
}
