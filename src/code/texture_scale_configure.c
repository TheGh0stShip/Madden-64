#include "types.h"

typedef union IntPair {
    s64 full;
    struct {
        u32 high;
        u32 low;
    } half;
} IntPair;

void texture_scale_configure(u8 *object, u8 scale, u8 index)
{
    register u8 *saved_object __asm__("$7") = object;
    register s32 base __asm__("$2");
    register s32 multiply_value __asm__("$8");
    register s32 multiplier __asm__("$9");
    register IntPair product __asm__("$14");
    register s32 unit __asm__("$4");
    s32 first;
    s32 second;

    if (scale < 0x3C) {
        scale = 0x3C;
    }
    if (scale >= 0x57) {
        scale = 0x56;
    }
    base = scale * 4 - 0x35;
    multiply_value = base;
    __asm__ volatile("" : "=r"(multiply_value) : "0"(multiply_value));
    multiplier = 0x26666;
    *(volatile s32 *)(saved_object + 0x3C) = base;
    __asm__ volatile("" : : "m"(*(volatile s32 *)(saved_object + 0x3C)));
    product.full = (s64)multiply_value * multiplier;
    product.half.high <<= 16;
    product.half.low >>= 16;
    multiply_value = product.half.high | product.half.low;
    __asm__ volatile("" : "=r"(multiply_value) : "0"(multiply_value));
    unit = 0x10000;
    first = unit + index * 64;
    second = unit + index * 32;
    *(volatile s32 *)(saved_object + 0x3C) = multiply_value;
    *(volatile s32 *)(saved_object + 0x40) = unit;
    *(volatile s32 *)(saved_object + 0x44) = first;
    *(s32 *)(saved_object + 0x48) = second;
}
