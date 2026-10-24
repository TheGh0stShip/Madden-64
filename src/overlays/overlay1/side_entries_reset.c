#include "types.h"

extern u16 D_8006B7B8[];
extern u16* D_8006B8B0[];

void func_800ACB2C(u32 side) {
    u16 index = 0;
    u16** entry_lists = D_8006B8B0;
    u16** entries = &entry_lists[side];
    register u16 expected __asm__("$7") = 1;
    u16* state_base = D_8006B7B8;
    u16* other_state;

    side ^= 1;
    other_state = &state_base[side];

    do {
        if ((*entries)[index] != expected) {
            (*entries)[index] = *other_state ? -1 : 0x1F;
        }
        index++;
    } while (index < 8);
}
