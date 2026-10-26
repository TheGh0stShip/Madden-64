#include "types.h"

extern u32 D_80087998;

u16 runtime_sequence_advance(void)
{
    register u32 state __asm__("$4") = D_80087998;
    register u32 high __asm__("$5") = state >> 16;
    register u32 low __asm__("$4") = (u16)state;
    register u32 upper __asm__("$6");
    register u32 low_product __asm__("$4");
    register u32 high_product __asm__("$2");
    register u32 combined __asm__("$5");
    register u32 value __asm__("$2");
    register u32 next __asm__("$6");
    register u32 work_v1 __asm__("$3");
    register u32 work_v0 __asm__("$2");

    work_v1 = (high << 3) - high;
    work_v1 = (work_v1 << 2) + high;
    work_v0 = (work_v1 << 7) - work_v1;
    work_v0 = (work_v0 << 2) - high;
    work_v0 <<= 2;
    upper = high + work_v0;
    __asm__("" : "=r"(upper) : "0"(upper), "r"(low));
    work_v1 = (low << 3) - low;
    work_v1 = (work_v1 << 2) + low;
    work_v0 = (work_v1 << 7) - work_v1;
    work_v0 = (work_v0 << 2) - low;
    work_v0 <<= 2;
    low_product = low + work_v0;
    __asm__("" : "=r"(low_product) : "0"(low_product), "r"(upper));
    high_product = high * 47936;
    combined = high_product + low_product;
    work_v0 = upper << 16;
    work_v1 = upper >> 16;
    value = (work_v0 | work_v1) + combined;
    next = (value << 16 | value >> 16) + 1;

    D_80087998 = next;
    return next;
}
