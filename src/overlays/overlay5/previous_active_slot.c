#include "types.h"

extern s16 SLOTS[8];

s32 overlay5_previous_active_slot(s32 slot) {
    if (slot != 0) {
        slot--;
    } else {
        slot = 7;
    }

    if (SLOTS[slot] == -1) {
        do {
            if (slot != 0) {
                slot--;
            } else {
                slot = 7;
            }
        } while (SLOTS[slot] == -1);
    }
    return slot;
}
