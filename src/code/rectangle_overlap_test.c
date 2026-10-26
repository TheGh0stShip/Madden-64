#include "types.h"

extern void func_800431BC(void *object, s32 *position, s32 mode);

u8 rectangle_overlap_test(void *object, s16 *rectangle)
{
    s32 position[2];
    u64 stack_pad;
    register s32 accumulator __asm__("$4");
    register s32 x __asm__("$3");
    register s32 comparison __asm__("$2");
    register s32 *position_pointer __asm__("$5");

    func_800431BC(object, position, 1);
    accumulator = rectangle[0];
    x = position[0];
    __asm__ volatile("" : : "r"(x));
    comparison = rectangle[1];
    position_pointer = position;
    __asm__ volatile("" : "=r"(position_pointer) : "0"(position_pointer));
    accumulator = x < accumulator;
    if (comparison < x) {
        accumulator = 1;
    }
    x = rectangle[2];
    comparison = position_pointer[1];
    accumulator = (u16)accumulator;
    if (comparison < x) {
        accumulator |= 1;
    }
    comparison = rectangle[3];
    x = position_pointer[1];
    accumulator = (u16)accumulator;
    if (comparison < x) {
        accumulator |= 1;
    }
    __asm__ volatile("" : "=m"(stack_pad));
    return accumulator;
}
