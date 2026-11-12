#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_80063B0C
#endif
#ifndef LIST_OFFSET
#define LIST_OFFSET 0x40
#endif

extern u8 *func_800635DC(void *object, s32 mode, s32 size);

void FUNCTION(u8 *object_arg, s32 mode_arg, s32 value20_arg, s32 value8_arg,
              s32 value4_arg, s32 valueC_arg)
{
    u8 *object = object_arg;
    s32 mode = mode_arg;
    s32 value20 = value20_arg;
    s32 value8 = value8_arg;
    s32 value4 = value4_arg;
    s32 valueC = valueC_arg;
    u8 *container = *(u8 **)(object + 4);
    u8 *record;

    if (mode != 1) {
        {
            u8 *inner = *(u8 **)object;
            *(s32 *)(inner + 0x14) = 12;
        }
        {
            u8 *inner = *(u8 **)object;
            *(s32 *)(inner + 0x18) = mode;
        }
        {
            u8 *inner = *(u8 **)object;
            (*(void (**)(void))inner)();
        }
    }
    record = func_800635DC(object, mode, 0x80);
    *(s32 *)(record + 0x00) = 0;
    *(s32 *)(record + 0x04) = value4;
    *(s32 *)(record + 0x08) = value8;
    *(s32 *)(record + 0x0C) = valueC;
    *(s32 *)(record + 0x20) = value20;
    *(s32 *)(record + 0x28) = 0;
    *(u8 **)(record + 0x2C) = *(u8 **)(container + LIST_OFFSET);
    *(u8 **)(container + LIST_OFFSET) = record;
}
