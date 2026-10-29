#include "types.h"

typedef struct { s32 unk0; s32 unk4; s32 unk8[7]; } SEnt;

static inline s16 sort_pass(SEnt *cur) {
    SEnt tmp;
    SEnt *next;
    s32 swapped = 0;
    for (next = cur + 1; next->unk0 != 0; next++) {
        if (next->unk4 > cur->unk4) {
            tmp = *next;
            *next = *cur;
            *cur = tmp;
            swapped = 1;
        }
        cur = next;
    }
    return swapped;
}

void func_800CDF48(SEnt *arr) {
    while (sort_pass(arr) != 0);
}
