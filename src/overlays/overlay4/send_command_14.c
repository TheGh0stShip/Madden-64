#include "types.h"

extern s32 func_800E1BCC(void* object, u8* command);

s32 func_800CAC78(void* object) {
    u8 command[4];

    command[0] = 0x14;
    command[1] = 1;
    command[2] = 8;
    command[3] = 4;
    return func_800E1BCC(object, command);
}
