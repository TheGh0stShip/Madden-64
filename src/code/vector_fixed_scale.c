#include "types.h"

typedef struct VectorScaleTarget {
    u8 pad[8];
    u8* value;
} VectorScaleTarget;

void func_8000ED24(VectorScaleTarget* target, s32* scale) {
    register u8* value __asm__("$2");
    register s32 factor __asm__("$6");
    register s32 last_factor __asm__("$5");
    register s32 product __asm__("$3");

    value = target->value;
    factor = scale[0];
    product = *(s32*)(value + 0xC4);
    __asm__("mult %0,%2\n\tmfhi $t6\n\tmflo $t7\n\tsll $t6,$t6,16\n\tsrl $t7,$t7,16\n\tor %0,$t6,$t7"
            : "=r"(product) : "0"(product), "r"(factor) : "t6", "t7", "hi", "lo");
    *(s32*)(value + 0xC4) = product;
    product = *(s32*)(value + 0xC8);
    factor = scale[1];
    __asm__("mult %0,%2\n\tmfhi $t6\n\tmflo $t7\n\tsll $t6,$t6,16\n\tsrl $t7,$t7,16\n\tor %0,$t6,$t7"
            : "=r"(product) : "0"(product), "r"(factor) : "t6", "t7", "hi", "lo");
    *(s32*)(value + 0xC8) = product;
    product = *(s32*)(value + 0xCC);
    last_factor = scale[2];
    __asm__("mult %0,%2\n\tmfhi $t6\n\tmflo $t7\n\tsll $t6,$t6,16\n\tsrl $t7,$t7,16\n\tor %0,$t6,$t7"
            : "=r"(product) : "0"(product), "r"(last_factor) : "t6", "t7", "hi", "lo");
    *(s32*)(value + 0xCC) = product;
}
