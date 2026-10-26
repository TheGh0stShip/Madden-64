#include "types.h"

extern f32 D_800006A0;
extern f32 D_800006A4;

void display_viewport_configure(u8 *object)
{
    register u32 width __asm__("$5") = *(u16 *)(object + 0x1FC);
    register u32 x __asm__("$6") = *(u16 *)(object + 0x1F8);
    register u32 y __asm__("$3") = *(u16 *)(object + 0x1FA);
    register u32 height __asm__("$7") = *(u16 *)(object + 0x1FE);
    register s32 value __asm__("$2");
    register f32 first __asm__("$f0");
    register f32 second __asm__("$f2");

    __asm__ volatile("" : "=r"(width), "=r"(x), "=r"(y), "=r"(height)
                     : "0"(width), "1"(x), "2"(y), "3"(height));
    first = D_800006A0;
    second = D_800006A4;
    __asm__ volatile("" : "=f"(first), "=f"(second) : "0"(first), "1"(second));
    *(volatile u16 *)(object + 0x218) = 0x280;
    *(volatile u16 *)(object + 0x21A) = 0x1E0;
    *(volatile u16 *)(object + 0x21C) = 0x3FF;
    __asm__ volatile("" : : "m"(*(volatile u16 *)(object + 0x21C)));
    value = x + width;
    y += height;
    width >>= 1;
    x += width;
    *(volatile u16 *)(object + 0xC) = y;
    y = *(u16 *)(object + 0x1FE);
    width = *(u16 *)(object + 0x1FA);
    *(volatile u16 *)(object + 0x21E) = 0;
    *(volatile u16 *)(object + 0x224) = 0;
    *(volatile u16 *)(object + 0x226) = 0;
    *(volatile u16 *)(object + 0xA) = value;
    value = (s16)x;
    *(volatile f32 *)(object + 0x228) = first;
    first = value;
    __asm__ volatile("" : "=f"(first) : "0"(first), "r"(value));
    x <<= 2;
    *(volatile f32 *)(object + 0x22C) = second;
    *(volatile f32 *)(object + 0x230) = first;
    *(volatile u16 *)(object + 0x220) = x;
    y >>= 1;
    width += y;
    value = (s16)width;
    first = value;
    __asm__ volatile("" : "=f"(first) : "0"(first), "r"(value));
    width <<= 2;
    *(volatile f32 *)(object + 0x234) = first;
    *(u16 *)(object + 0x222) = width;
}
