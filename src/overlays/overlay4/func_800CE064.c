#include "types.h"

typedef struct { u8 pad0[0x1C]; s32 unk1C; } SPos;
typedef struct { u8 pad0[0x24]; SPos *unk24; } SPl;
typedef struct { SPl *unk0; s32 unk4[8]; } SEnt;

extern SPos *D_80086178;
int abs(int);

static inline s16 sort_pass(SEnt *cur) {
    SEnt tmp;
    SEnt *next;
    s32 swapped = 0;

    for (next = cur + 1; next->unk0 != 0; next++) {
        if (abs(next->unk0->unk24->unk1C - D_80086178->unk1C) < abs(cur->unk0->unk24->unk1C - D_80086178->unk1C)) {
            tmp = *next;
            *next = *cur;
            *cur = tmp;
            swapped = 1;
        }
        cur = next;
    }
    return swapped;
}

void func_800CE064(SEnt *arr) {
    while (sort_pass(arr) != 0);
}
