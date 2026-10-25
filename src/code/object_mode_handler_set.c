#include "types.h"

typedef void (*ObjectMethod)(void);

extern void func_8005B278(void);
extern void func_8005B1B4(void);
extern void func_8005B450(void);
extern void func_8005ACDC(void);

void object_mode_handler_set(u8 *owner, s32 mode)
{
    u8 *state = *(u8 **)(owner + 0x1A4);

    if (mode == 0) {
        goto mode_zero;
    }
    if (mode == 2) {
        goto mode_two;
    }
    goto default_mode;
mode_zero:
    {
        u8 *configuration = *(u8 **)(owner + 0x1C0);

        if (*(u32 *)(configuration + 8) != 0) {
            *(void **)(state + 4) = func_8005B278;
            func_8005ACDC();
            *(u32 *)(state + 0x40) = 0;
            *(u32 *)(state + 0x44) = 0;
            *(u32 *)(state + 0x4C) = 0;
        } else {
            *(void **)(state + 4) = func_8005B1B4;
        }
        *(u32 *)(state + 0x30) = 0;
        *(u32 *)(state + 0x34) = 0;
        goto done;
    }
mode_two:
    *(void **)(state + 4) = func_8005B450;
    goto done;
default_mode:
    (*(u32 **)owner)[5] = 4;
    ((ObjectMethod)(*(u32 **)owner)[0])();
done:
    ;
}
