#include "types.h"

typedef struct AccumulatorState {
    u8 pad00[0x24];
    s32 accumulator;
} AccumulatorState;

typedef struct AccumulatorOwner {
    u8 pad00[0x24];
    AccumulatorState *state;
} AccumulatorOwner;

extern void func_800B9184(AccumulatorState *state, s32 values[3]);

void object_accumulator_add(AccumulatorOwner *owner, s32 value)
{
    s32 values[3];

    values[2] = value + 0x20000;
    values[0] = 0;
    values[1] = 0;
    func_800B9184(owner->state, values);
    owner->state->accumulator += values[2];
}
