#include "types.h"

typedef union IntPair {
    s64 full;
    struct {
        u32 high;
        u32 low;
    } half;
} IntPair;

typedef struct DisplayVector {
    s32 x;
    s32 y;
    s32 velocity;
    s32 pad0C;
} DisplayVector;

extern s32 D_8007AB04[];

void display_vectors_integrate(DisplayVector *vectors_arg)
{
    register DisplayVector *vectors __asm__("$8") = vectors_arg;
    register u16 index __asm__("$6") = 0;
    register s32 *rates __asm__("$7") = D_8007AB04;
    register s32 *second_rate __asm__("$9") = D_8007AB04 + 1;
    register IntPair product __asm__("$14");
    register s32 scaled __asm__("$3");
    register DisplayVector *entry __asm__("$2");
    register s32 x __asm__("$4");
    register s32 y __asm__("$5");
    register s32 velocity __asm__("$10");
    register s32 rate __asm__("$11");

    do {
        entry = (DisplayVector *)(((u32)index << 4) + (u32)vectors);
        x = entry->x;
        __asm__ volatile("" : "=r"(x) : "0"(x));
        y = entry->y;
        __asm__ volatile("" : "=r"(y) : "0"(y));
        velocity = entry->velocity;
        __asm__ volatile("" : "=r"(velocity) : "0"(velocity));
        rate = rates[0];
        __asm__ volatile("" : : "r"(entry), "r"(x), "r"(y),
                         "r"(velocity), "r"(rate));
        product.full = (s64)velocity * rate;
        product.half.high <<= 16;
        product.half.low >>= 16;
        scaled = product.half.high | product.half.low;
        __asm__ volatile("" : "=r"(scaled) : "0"(scaled));
        velocity = entry->velocity;
        index++;
        x += scaled;
        entry->x = x;
        rate = second_rate[0];
        __asm__ volatile("" : : "r"(velocity), "r"(rate));
        product.full = (s64)velocity * rate;
        product.half.high <<= 16;
        product.half.low >>= 16;
        scaled = product.half.high | product.half.low;
        __asm__ volatile("" : "=r"(scaled) : "0"(scaled));
        y += scaled;
        entry->y = y;
        entry->velocity = 0;
    } while (index < 8);
}
