#include "types.h"

typedef struct UiResourceState {
    u8 pad[0x24];
    void *resource;
} UiResourceState;

typedef struct UiSlot {
    u8 pad[8];
    UiResourceState *state;
} UiSlot;

extern s32 D_800692AC;
extern UiSlot *D_8007947C[];
extern void ui_slot_release(UiSlot *slot, s32 owner);

void ui_slots_release_all(s32 owner)
{
    s32 index;
    UiSlot **slot;
    register s32 count __asm__("$2") = D_800692AC;

    if (count != 0) {
        UiSlot **base = D_8007947C;

        index = count - 1;
        slot = &base[index];
        do {
            s32 current = index;
            UiSlot *value = *slot;

            if (value->state->resource != 0) {
                ui_slot_release(value, owner);
            }
            slot--;
            index--;
            if (current == 0) {
                break;
            }
        } while (1);
    }
}
