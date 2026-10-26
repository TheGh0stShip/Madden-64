#include "types.h"

typedef struct ResourceScaleState {
    u8 pad00[4];
    u8 *step;
    u8 pad08[2];
    u16 horizontal;
    s16 position;
    u8 pad0E[2];
    u16 vertical;
} ResourceScaleState;

typedef struct ResourceScaleContext {
    u8 pad00[8];
    ResourceScaleState *state;
} ResourceScaleContext;

void resource_scale_advance(ResourceScaleContext *context, s32 amount)
{
    register ResourceScaleState *state __asm__("$6") = context->state;
    register s32 previous __asm__("$8");
    register u32 vertical __asm__("$7");
    register u32 horizontal __asm__("$4");
    register u32 adjusted_vertical __asm__("$3");
    register u32 adjusted_horizontal __asm__("$2");
    register s32 first_position __asm__("$2");
    register s32 second_position __asm__("$5");
    u32 horizontal_product;

    previous = state->position;
    __asm__("" : "=r"(previous) : "0"(previous));
    vertical = state->vertical;
    state->position = state->step[0] + amount;
    __asm__("" ::: "memory");
    vertical <<= 4;
    first_position = state->position;
    adjusted_vertical = (u32)((vertical & 0xFFF0) * first_position) /
                        (u32)previous;
    horizontal = state->horizontal;
    __asm__("" : "=r"(horizontal) : "0"(horizontal));
    __asm__("" ::: "memory");
    second_position = state->position;
    horizontal_product = (s16)(horizontal << 4) * second_position;
    adjusted_horizontal = horizontal_product / (u32)previous;
    state->vertical = vertical;
    state->horizontal = horizontal << 4;
    state->vertical = ((u16)adjusted_vertical + 8) >> 4;
    state->horizontal = ((s16)adjusted_horizontal + 8) >> 4;
}
