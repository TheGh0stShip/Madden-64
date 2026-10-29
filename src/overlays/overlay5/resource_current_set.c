#include "types.h"

typedef struct Overlay5CurrentState {
    u8 pad00[8];
    void *current;
    u8 pad0C[4];
    u8 mode;
} Overlay5CurrentState;

extern Overlay5CurrentState *D_80072380;

void func_800DE074(void);

void overlay5_resource_current_set(void *resource) {
    Overlay5CurrentState *state;

    state = D_80072380;
    state->current = resource;
    state->mode = 4;
    func_800DE074();
}
