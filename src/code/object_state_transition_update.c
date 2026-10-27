#include "types.h"

typedef void (*ObjectAction)(void *object);
typedef s32 (*ObjectTest)(void *object);

s32 func_80054CD4(u8 *object)
{
    u8 *table;
    s32 boundary;

    if ((u32)(*(s32 *)(object + 0x10) - 0xCD) < 2 &&
        *(s32 *)(object + 0x40) != 0) {
        (*(ObjectAction *)(*(u8 **)(object + 0x1A0) + 4))(object);
        *(s32 *)(object + 0x10) = 0xD0;
    } else if (*(s32 *)(object + 0x10) != 0xD0) {
        *(s32 *)(*(u8 **)object + 0x14) = 0x12;
        *(s32 *)(*(u8 **)object + 0x18) = *(s32 *)(object + 0x10);
        (*(ObjectAction *)*(u8 **)object)(object);
    }

    while ((boundary = *(s32 *)(object + 0x90)) <=
               *(s32 *)(object + 0x98) &&
           *(s32 *)((table = *(u8 **)(object + 0x1B0)) + 0x14) == 0) {
        if ((*(ObjectTest *)table)(object) == 0) {
            return 0;
        }
    }
    *(s32 *)(object + 0x10) = 0xCF;
    return 1;
}
