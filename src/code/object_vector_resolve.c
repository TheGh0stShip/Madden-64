#include "types.h"

typedef struct ObjectVectorSource {
    u8 pad00[0x1C];
    s32 x;
    s32 y;
    s32 z;
} ObjectVectorSource;

u32 object_vector_resolve(volatile ObjectVectorSource *source,
                          volatile s32 *output, s32 angle, s32 negative)
{
    register s32 saved_angle __asm__("$6") = -angle;

    if (negative != 0) {
        register s32 temp __asm__("$2") = source->x;
        register s32 result __asm__("$3") = 0x4CCCC;
        register s32 left __asm__("$14");
        register s32 right __asm__("$15");

        __asm__("" : "=r"(result) : "0"(result));
        temp = -temp;
        left = temp >> 8;
        __asm__("" : "=r"(result) : "0"(result), "r"(left));
        right = result >> 8;
        result = left * right;
        output[0] = result;
        temp = source->y;
        {
            register s32 result2 __asm__("$8") = 0x4CCCC;

            __asm__("" : "=r"(result2) : "0"(result2));
            temp = -temp;
            left = temp >> 8;
            __asm__("" : "=r"(result2) : "0"(result2), "r"(left));
            right = result2 >> 8;
            result2 = left * right;
            output[1] = result2;
        }
    } else {
        register s32 temp __asm__("$3") = source->x;
        register s32 result __asm__("$8") = 0x4CCCC;
        register s32 left __asm__("$14");
        register s32 right __asm__("$15");

        __asm__("" : "=r"(result) : "0"(result));
        left = temp >> 8;
        __asm__("" : "=r"(result) : "0"(result), "r"(left));
        right = result >> 8;
        result = left * right;
        output[0] = result;
        result = 0x4CCCC;
        __asm__("" : "=r"(result) : "0"(result));
        temp = source->y;
        left = temp >> 8;
        __asm__("" : "=r"(result) : "0"(result), "r"(left));
        right = result >> 8;
        result = left * right;
        output[1] = result;
        saved_angle -= 0x800;
    }
    {
        register s32 temp __asm__("$4") = source->z;
        register s32 result __asm__("$3") = 0x4CCCC;
        register s32 left __asm__("$14");
        register s32 right __asm__("$15");

        __asm__("" : "=r"(result) : "0"(result));
        left = temp >> 8;
        __asm__("" : "=r"(result) : "0"(result), "r"(left));
        right = result >> 8;
        result = left * right;
        output[2] = result;
    }
    return saved_angle & 0xFFF;
}
