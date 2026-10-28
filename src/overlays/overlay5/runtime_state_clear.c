#include "types.h"

typedef struct Overlay5RuntimeState {
    u8 pad00[0x1C];
    s32 values[6];
} Overlay5RuntimeState;

Overlay5RuntimeState *func_800DD634(void);
void func_800D628C(void *object);

void overlay5_runtime_state_clear(void *object) {
    Overlay5RuntimeState *state = func_800DD634();

    func_800D628C(object);
    state->values[0] = 0;
    state->values[1] = 0;
    state->values[2] = 0;
    state->values[3] = 0;
    state->values[4] = 0;
    state->values[5] = 0;
}
