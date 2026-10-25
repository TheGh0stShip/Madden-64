#include "types.h"

extern u16 func_8003B02C(void *frame);
extern u16 func_8003B3A0(void *frame);
extern u16 func_8003B6AC(void *frame);

u16 frame_value_combine(void *frame)
{
    u32 value;
    u32 quotient;
    u16 first;
    u16 second;
    u16 third;

    first = func_8003B02C(frame);
    second = func_8003B3A0(frame);
    third = func_8003B6AC(frame);
    value = (first + second) * 2;
    value += third;
    quotient = value / 5;
    if (value % 5 >= 3) {
        quotient++;
    }
    return quotient;
}
