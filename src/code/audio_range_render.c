#include "types.h"

extern void func_8003D0C4(void *object);
extern void func_8003D8F4(void *object, s32 first, s32 second);

void audio_range_render(void *object, s32 unused, s32 level, s32 position)
{
    register void *saved_object __asm__("$19") = object;
    register s32 saved_level __asm__("$18") = level;
    register s32 saved_position __asm__("$17") = position;
    register s32 original_level __asm__("$16");
    register s32 first __asm__("$5");
    register s32 second __asm__("$6");
    register s32 quotient __asm__("$4");
    register s32 signed_position __asm__("$3");
    register s32 midpoint __asm__("$5");
    register s32 temp __asm__("$2");
    register s32 compare __asm__("$2");
    register void *call_object __asm__("$4");

    func_8003D0C4(saved_object);
    temp = saved_position << 16;
    signed_position = temp >> 16;
    __asm__("" : "=r"(signed_position) : "0"(signed_position));
    midpoint = 0x10;
    original_level = saved_level;
    if (signed_position != midpoint) {
        __asm__("" : "=r"(original_level) : "0"(original_level));
        temp = saved_level << 16;
        temp >>= 16;
        quotient = temp / 16;
        __asm__("" : "=r"(quotient) : "0"(quotient));
        compare = signed_position < 0x10;
        if (compare) {
            first = original_level;
            second = quotient * saved_position;
        } else {
            temp = saved_position - midpoint;
            __asm__("" : "=r"(temp) : "0"(temp));
            temp = midpoint - temp;
            first = quotient * temp;
            second = original_level;
        }
    } else {
        __asm__("" : "=r"(original_level) : "0"(original_level));
        second = original_level;
        first = second;
    }
    call_object = saved_object;
    __asm__("" : "=r"(call_object) : "0"(call_object));
    first <<= 16;
    second <<= 16;
    func_8003D8F4(call_object, first >> 16, second >> 16);
}
