#include "types.h"

extern s16 D_800894FC;
extern volatile u32 D_80080C10;
extern void *volatile D_8008A058;
extern void *volatile D_80086178;
extern s32 func_80031A1C(s32 value);
extern s16 func_8001FA38(s32 value);
extern void func_8001FA68(s32 mode, void *input, void *first, void *second);

void menu_input_activation_update(volatile u8 *object_arg,
                                  volatile u8 *input_arg)
{
    register volatile u8 *object __asm__("$17") = object_arg;
    register volatile u8 *input __asm__("$18") = input_arg;
    register u16 threshold __asm__("$16");
    void *first;
    void *second;
    register u8 *object_base __asm__("$2");
    register u8 *global_base __asm__("$3");

    if (D_800894FC != 0) {
        return;
    }
    if (!(D_80080C10 & 0x4000)) {
        return;
    }
    if (object != D_8008A058) {
        return;
    }
    threshold = func_80031A1C(((input[0x18] * 3) >> 1) + 0x28) & 0xFFFF;
    if ((func_8001FA38(3) / 2) - 1 < threshold) {
        return;
    }
    threshold = input[0xE];
    if ((u16)func_80031A1C(0xC8) >= threshold) {
        object_base = *(u8 *volatile *)(object + 0x24);
        global_base = D_80086178;
        first = *(void *volatile *)(object_base + 0x20);
        second = *(void *volatile *)(global_base + 0x20);
        func_8001FA68(0xD, (void *)input, first, second);
        return;
    }
    object_base = *(u8 *volatile *)(object + 0x24);
    global_base = D_80086178;
    first = *(void *volatile *)(object_base + 0x20);
    second = *(void *volatile *)(global_base + 0x20);
    func_8001FA68(3, (void *)input, first, second);
}
