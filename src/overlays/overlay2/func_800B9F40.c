#include "types.h"

typedef struct {
    u8 pad00[0x3A];
    u16 total;
    s16 remaining;
    u8 pad3E[0x12];
    u8 parts[5];
} Tally;

extern Tally *D_800895EC;
extern s32 D_80087780[];

void func_800167FC(s16, s32, u16);

void func_800B9F40(u16 slot, s32 value) {
    u16 i;
    u16 sum;
    u16 total;

    sum = 0;
    for (i = 0; i < 5; i++) {
        sum += D_800895EC->parts[i];
    }
    total = D_800895EC->total;
    if (sum < total) {
        D_800895EC->remaining = total - sum;
    } else {
        D_800895EC->remaining = 0;
    }
    func_800167FC(D_800895EC->remaining, value, total);
    D_80087780[slot] = value;
}
