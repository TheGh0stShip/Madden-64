#include "types.h"

typedef struct RuntimeStackState {
    s32 *items;
    u8 pad04[4];
    s32 current;
    u8 pad0C[4];
    u8 state;
    u8 pad11;
    s8 index;
} RuntimeStackState;

extern RuntimeStackState *D_80072380;

void func_800DE074(void);

void overlay5_runtime_stack_advance(void) {
    RuntimeStackState *state;

    state = D_80072380;
    if (state->index >= 0) {
        state->current = state->items[state->index--];
        D_80072380->state = 4;
        func_800DE074();
    }
}
