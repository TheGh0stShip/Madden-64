#include "types.h"

typedef struct BitRange {
    u16 start;
    u16 end;
} BitRange;

extern BitRange D_80074774[];
extern u8 D_80087710[];

void func_80041EF8(s32 range_index) {
    u32 start = D_80074774[range_index].start;
    u32 end = D_80074774[range_index].end;

    if ((start | end) == 0) {
        return;
    }
    if (end < start) {
        return;
    }
    do {
        D_80087710[start >> 3] &= ~(1 << (start & 7));
        start++;
    } while (start <= end);
}
