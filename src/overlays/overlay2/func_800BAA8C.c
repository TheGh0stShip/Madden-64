#include "types.h"

typedef struct {
    u8 pad00[0x5B];
    u8 count;
} Tally;

extern Tally *D_800895EC;

void func_800BA9FC(u16, u16, s32);

void func_800BAA8C(u16 base, s32 cb) {
    u16 i;

    for (i = 0; i < D_800895EC->count; i++) {
        func_800BA9FC(i, base + i, cb);
    }
}
