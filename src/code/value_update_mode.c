#include "types.h"

typedef struct ValueState {
    u32 field0;
    s32 base;
    s32 value;
} ValueState;

void func_80019944(ValueState* state, s32 amount, s32 mode) {
    switch (mode) {
        case 1:
            state->value = amount;
            break;
        case 0:
            state->value += amount;
            break;
        case 2:
            state->value = state->base + amount;
            break;
    }
}
