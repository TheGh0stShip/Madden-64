#include "types.h"

typedef struct ImageTableDecodeContext ImageTableDecodeContext;

typedef struct ImageTableAllocator {
    void *(*allocate_simple)(void);
    void *(*allocate_other)(void);
    void *(*allocate)(ImageTableDecodeContext *context, u32 count,
        u32 size, u32 dimensions);
} ImageTableAllocator;

typedef struct ImageTableDecodeState {
    u8 pad00[0x14];
    s32 total;
    u8 **tables;
    s32 extended;
    s32 sizes[1];
} ImageTableDecodeState;

struct ImageTableDecodeContext {
    void *event;
    ImageTableAllocator *allocator;
    u8 pad008[0x50];
    s32 mode;
    u8 pad05C[0x1C];
    s32 dimensions;
    u8 pad07C[0x14C];
    ImageTableDecodeState *state;
};

extern s32 func_8006012C(ImageTableDecodeContext *context, s32 dimension,
    s32 coordinate, s32 maximum);

void image_table_decode(ImageTableDecodeContext *context)
{
    register ImageTableDecodeContext *saved_context __asm__("$23") = context;
    ImageTableDecodeState *volatile state = context->state;
    ImageTableDecodeState *volatile state_cursor;
    volatile s32 extension;
    register s32 remaining;
    register s32 dimension __asm__("$21");
    u64 stack_padding;
    u64 stack_padding2;

    __asm__("" : : "m"(stack_padding), "m"(stack_padding2));
    if (saved_context->mode == 1) {
        extension = 0x1FE;
        state->extended = 1;
    } else {
        extension = 0;
        state->extended = 0;
    }

    state->tables = saved_context->allocator->allocate(saved_context, 1,
        extension + 0x100, saved_context->dimensions);
    remaining = state->total;
    dimension = 0;
    if (saved_context->dimensions > 0) {
        state_cursor = state;
        do {
            register s32 size __asm__("$22") = state_cursor->sizes[0];
            register u8 *table __asm__("$20");
            register s32 coordinate __asm__("$19") = 0;
            register s32 value __asm__("$16") = 0;
            register s32 output __asm__("$18") = 0;
            register u8 *out __asm__("$17");
            s32 threshold;

            remaining /= size;
            if (extension != 0) {
                state->tables[dimension] += 0xFF;
            }

            table = state->tables[dimension];
            out = table;
            threshold = func_8006012C(saved_context, dimension, 0, size - 1);
            do {
                while (threshold < value) {
                    output += remaining;
                    coordinate++;
                    threshold = func_8006012C(saved_context, dimension,
                        coordinate, size - 1);
                }
                *out = output;
                value++;
                out++;
            } while (value < 0x100);

            if (extension != 0) {
                register u8 *left __asm__("$4") = table - 1;

                value = 1;
                do {
                    *left = table[0];
                    table[0xFF + value] = table[0xFF];
                    value++;
                    left--;
                } while (value < 0x100);
            }

            state_cursor = (ImageTableDecodeState *)((u8 *)state_cursor + 4);
            dimension++;
        } while (dimension < saved_context->dimensions);
    }
}
