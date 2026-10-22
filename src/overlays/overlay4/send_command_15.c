#include "types.h"

extern s32 func_800E1BCC(void* object, u8* command);

s32 func_800CACFC(void* object) {
    u8 command[1];

    command[0] = 0x15;
    return func_800E1BCC(object, command);
}
