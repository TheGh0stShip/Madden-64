#include "types.h"

typedef struct {
    u8 pad00[0x10];
    s16 slots[16];
} Tally;

extern Tally *D_800895EC;

s16 func_800BAB0C(s16 i) {
    while (D_800895EC->slots[i] == -1 && i < 0x10) {
        i++;
    }
    return i;
}
