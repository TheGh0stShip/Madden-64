#include "types.h"

typedef struct ResourceScaleState {
    u8 pad00[4];
    u8 *step;
    u8 pad08[2];
    s16 horizontal;
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
    ResourceScaleState *state = context->state;
    u32 previous = state->position;
    u16 vertical;
    s16 horizontal;

    state->position = state->step[0] + amount;
    state->vertical <<= 4;
    vertical = state->vertical * state->position / previous;
    state->horizontal <<= 4;
    horizontal = state->horizontal * state->position / previous;
    state->vertical = (vertical + 8) >> 4;
    state->horizontal = (horizontal + 8) >> 4;
}
