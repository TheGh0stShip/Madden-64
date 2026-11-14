#include "types.h"

typedef struct {
    u8 pad00[0x50];
    u8 parts[5];
} Tally;

extern Tally *D_800895EC;

u8 func_800BB2F8(u16 index) {
    u8 value = D_800895EC->parts[index];
    s32 cmp = value;
    s32 copy = cmp;
    u8 other = value;
    u8 done = 0;
    u8 i = 0;

    do {
        if (copy + i == 0xFF || cmp != (u16)(other + i)) {
            done = 1;
        } else {
            i++;
        }
    } while (done == 0);
    return i;
}
