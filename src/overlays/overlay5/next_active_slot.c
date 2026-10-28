#include "types.h"

extern s16 D_800881A0[8];

s32 overlay5_next_active_slot(s32 slot) {
    slot = (slot + 1) % 8;
    if (D_800881A0[slot] == -1) {
        do {
            slot = (slot + 1) % 8;
        } while (D_800881A0[slot] == -1);
    }
    return slot;
}
