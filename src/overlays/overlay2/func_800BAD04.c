#include "types.h"

typedef struct {
    u8 unk_00[8];
    s16 unk_08;
    u8 unk_0A[6];
    s16 unk_10[17];
} Unk800BAD04;

extern Unk800BAD04 *D_800895EC;
s16 func_800BAB0C(s16);
s16 func_800BAB54(s16);

s32 func_800BAD04(void) {
    u16 i = 0;
    u16 count = 0;
    s16 start;
    s32 idx;

    start = func_800BAB0C(D_800895EC->unk_08 + 1);
    D_800895EC->unk_08 = start;
    for (; count < 5; i++) {
        idx = start + i;
        if (idx > 16) {
            break;
        }
        count += (D_800895EC->unk_10[idx] != -1) ? 1 : 0;
    }
    if (count != 5) {
        D_800895EC->unk_08 = func_800BAB54(D_800895EC->unk_08 - 1);
        return 0;
    }
    return 1;
}
