#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8006389C
#endif
#ifndef SIZE_SHIFT
#define SIZE_SHIFT 0
#endif

extern void **func_800635DC(void *object, s32 mode, s32 size);
extern u8 *func_800637A4(void *object, s32 mode, s32 size);

void **FUNCTION(u8 *object_arg, s32 mode_arg, u32 size_arg, s32 count_arg)
{
    register u8 *object __asm__("$19");
    register s32 mode __asm__("$22");
    register s32 count __asm__("$18");
    register u32 stride __asm__("$20");
    register s32 index __asm__("$16");
    register s32 chunk __asm__("$17");
    register void **array __asm__("$21");
    register void **result __asm__("$2");
    register u8 *container __asm__("$21");
    register u32 numerator __asm__("$2");
    u64 stack_pad;
#if SIZE_SHIFT
    register u32 raw_size __asm__("$23");
    raw_size = size_arg;
    __asm__("" : "=r"(raw_size) : "0"(raw_size));
    stride = raw_size << SIZE_SHIFT;
#else
    stride = size_arg;
    __asm__("" : "=r"(stride) : "0"(stride));
#endif
    numerator = 0x3B9AC9F0U;
    index = numerator / stride;
    count = count_arg;
    object = object_arg;
    __asm__("" : "=r"(object) : "0"(object));
    mode = mode_arg;
    __asm__("" : "=r"(mode) : "0"(mode));
    container = *(u8 **)(object + 4);
    if (index <= 0) {
        register u8 *inner_v1 __asm__("$3");
        register u8 *inner_v0 __asm__("$2");
        inner_v1 = *(u8 **)object;
        *(s32 *)(inner_v1 + 0x14) = 0x45;
        inner_v0 = *(u8 **)object;
        (*(void (**)(void))inner_v0)();
    }
    if (index < count) {
        chunk = index;
    } else {
        chunk = count;
    }
    *(s32 *)(container + 0x4C) = chunk;
    result = func_800635DC(object, mode, count << 2);
    index = 0;
    __asm__ volatile("" : "=r"(index) : "0"(index));
    array = result;
    if (count != 0) {
        do {
            register s32 remaining __asm__("$3");
            register s32 copies __asm__("$3");
            register u8 *source __asm__("$4");
            register void **output __asm__("$2");
            remaining = count - index;
            if ((u32)remaining < (u32)chunk) {
                chunk = remaining;
            }
#if SIZE_SHIFT
            source = func_800637A4(object, mode, (chunk * raw_size) << SIZE_SHIFT);
#else
            source = func_800637A4(object, mode, chunk * stride);
#endif
            copies = chunk;
            if (copies != 0) {
                output = (void **)(((u32)index << 2) + (u32)array);
                do {
                    *output++ = source;
                    index++;
                    copies--;
                    source += stride;
                } while (copies != 0);
            }
        } while ((u32)index < (u32)count);
    }
    __asm__ volatile("" : "=m"(stack_pad));
    return array;
}
