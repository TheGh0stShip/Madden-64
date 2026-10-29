#include "types.h"

typedef struct Overlay5SlotState {
    void **slots;
    u8 pad04[0xE];
    u8 slot_index;
} Overlay5SlotState;

extern Overlay5SlotState *D_80072380;

void overlay5_resource_slot_append(void *resource) {
    Overlay5SlotState *state;

    state = D_80072380;
    state->slot_index++;
    state->slots[(s8)state->slot_index] = resource;
}
