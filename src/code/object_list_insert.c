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
    register u8 *object __asm__("$16") = object_arg;
    register s32 mode __asm__("$17") = mode_arg;
    register s32 value20 __asm__("$20") = value20_arg;
    register s32 value8 __asm__("$19") = value8_arg;
    register s32 value4 __asm__("$21") = value4_arg;
    register s32 valueC __asm__("$22") = valueC_arg;
    register u8 *container __asm__("$18") = *(u8 **)(object + 4);
    u8 *record;

    if (mode != 1) {
        register u8 *inner_v1 __asm__("$3");
        register u8 *inner_v0 __asm__("$2");
        __asm__ volatile("" : "=r"(object) : "0"(object));
        inner_v1 = *(u8 **)object;
        *(s32 *)(inner_v1 + 0x14) = 12;
        inner_v0 = *(u8 **)object;
        *(s32 *)(inner_v0 + 0x18) = mode;
        inner_v0 = *(u8 **)object;
        (*(void (**)(void))inner_v0)();
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
