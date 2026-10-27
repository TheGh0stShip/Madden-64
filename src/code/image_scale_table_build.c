#include "types.h"

typedef struct ImageScaleContext ImageScaleContext;

typedef struct ImageScaleAllocator {
    void *(*allocate)(ImageScaleContext *context, u32 count, u32 size);
} ImageScaleAllocator;

struct ImageScaleContext {
    u32 field0;
    ImageScaleAllocator *allocator;
};

extern u8 D_80003418[];

s32 *func_8006056C(ImageScaleContext *context, s32 scale)
{
    register s32 denominator __asm__("$16");
    s32 *table;
    register s32 row __asm__("$9");
    register s32 limit __asm__("$10");
    register s32 *table_base __asm__("$11");
    register s32 *output_row __asm__("$8");
    register u8 *lookup_row __asm__("$7");

    denominator = scale;
    table = context->allocator->allocate(context, 1, 0x400);
    denominator = (denominator - 1) << 9;
    row = 0;
    limit = 255;
    table_base = table;
    output_row = table_base;
    lookup_row = D_80003418;

    do {
        register s32 column __asm__("$6") = 0;
        register s32 *output __asm__("$4") = output_row;
        register u8 *lookup __asm__("$5") = lookup_row;

        do {
            register s32 value __asm__("$2");
            register s32 shifted __asm__("$3");

            value = limit - (*lookup << 1);
            shifted = value << 8;
            value = shifted - value;

            if (value < 0) {
                value = -(-value / denominator);
            } else {
                value /= denominator;
            }
            *output++ = value;
            column++;
            lookup++;
        } while (column < 16);
        output_row += 16;
        row++;
        lookup_row += 16;
    } while (row < 16);
    return table_base;
}
