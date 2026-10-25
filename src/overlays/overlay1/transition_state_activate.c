#include "types.h"

typedef struct TransitionState {
    u8 pad00[0x64];
    u8 command;
    u8 pad65[0x3B];
    s32 state;
} TransitionState;

typedef struct TransitionOwner {
    u8 pad00[4];
    TransitionState *transition;
} TransitionOwner;

extern void func_800AEA9C(s32 enabled);

void transition_state_activate(TransitionOwner *owner)
{
    TransitionState *transition = owner->transition;

    if (transition->command == 0x33) {
        func_800AEA9C(1);
        transition->state = 2;
    }
}
