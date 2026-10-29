#include "types.h"

typedef struct {
    u8 pad00[8];
    u16 current;
    u8 pad0A[6];
    s16 slots[16];
} Tally;

extern Tally *D_800895EC;

s16 func_800BAB54(s16);

/* Steps the tally cursor back to the previous used slot; returns 1 if it moved within range. */
s32 func_800BADE4(void) {
    Tally *t = D_800895EC;
    s16 first;
    s16 next;

    first = 0;
    while (t->slots[(u16)first] == -1) {
        first++;
    }
    next = func_800BAB54(D_800895EC->current - 1);
    if (next < first) {
        return 0;
    }
    D_800895EC->current = next;
    return 1;
}
