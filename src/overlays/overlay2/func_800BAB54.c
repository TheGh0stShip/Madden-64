#include "types.h"

typedef struct {
    u8 pad00[0x10];
    s16 slots[1];
} Tally;

extern Tally *D_800895EC;

/* Index of the last used slot at or below i (unused slots are -1), clamped to 0. */
s32 func_800BAB54(s16 i) {
    while (D_800895EC->slots[i] == -1 && i >= 0) {
        i--;
    }
    return i & (~i >> 31);
}
