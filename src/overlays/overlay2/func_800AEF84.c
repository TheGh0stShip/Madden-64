#include "types.h"

typedef struct RecordAEF84 {
    u16 values[55];
    u8 pad006E[0x214C - 0x6E];
} RecordAEF84;

typedef struct ResultAEF84 {
    u8 pad0000[0xC];
    s16 totals[4];
    u8 category;
} ResultAEF84;

extern RecordAEF84 D_80080CFC[];

s32 func_80022B3C(u8 category, u16 index, s32 kind);

void func_800AEF84(ResultAEF84 *result) {
    u16 index;
    s32 total;
    u8 category;

    total = 0;
    index = 0;
    do {
        category = result->category;
        if (D_80080CFC[category].values[index] == 0xFFFF) {
            goto done;
        }
        total += func_80022B3C(category, index, 0x13);
        index++;
    } while (index < 55);
done:
    result->totals[result->category] = total;
}
