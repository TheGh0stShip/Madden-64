#include "types.h"

typedef struct EncodedModeObject {
    u8 pad00[0x21];
    u8 mode;
} EncodedModeObject;

extern void func_800317D8(s32 index, s8 first, s8 second);

void encoded_mode_dispatch(EncodedModeObject *object, s8 first, s8 second)
{
    u8 mode = object->mode;

    if ((mode & 0xC0) == 0x40) {
        func_800317D8(mode & 0x3F, first, second);
    }
}
