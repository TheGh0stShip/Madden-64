#include "types.h"

typedef struct StridedState {
    /* 0x00 */ u16 flags;
    /* 0x02 */ u16 unk_02;
    /* 0x04 */ u16 unk_04;
    /* 0x06 */ u16 unk_06;
    /* 0x08 */ u16 unk_08;
    /* 0x0A */ u16 unk_0A;
    /* 0x0C */ u16 unk_0C[0x60];
    /* 0xCC */ s32 unk_CC;
    /* 0xD0 */ u32 unk_D0;
    /* 0xD4 */ u16 unk_D4;
} StridedState;

extern StridedState D_80088B78[];
extern u32 memory_pool_range_take(s32 pool, u32 size);
extern void memory_move_overlap(u32 dst, void *src, s32 size);

s16 resource_archive_update(s16 index, void *data) {
    s16 found;
    s16 i;

    found = -1;
    for (i = 0; i < 2; i++) {
        if (!(D_80088B78[i].flags & 1)) {
            found = i;
            break;
        }
    }
    D_80088B78[found].unk_02 = D_80088B78[index].unk_02;
    D_80088B78[found].unk_04 = D_80088B78[index].unk_04;
    D_80088B78[found].unk_06 = D_80088B78[index].unk_06;
    D_80088B78[found].unk_08 = D_80088B78[index].unk_08;
    D_80088B78[found].unk_0A = D_80088B78[index].unk_0A;
    for (i = 0; i < 0x60; i++) {
        D_80088B78[found].unk_0C[i] = D_80088B78[index].unk_0C[i];
    }
    D_80088B78[found].unk_CC = D_80088B78[index].unk_CC;
    D_80088B78[found].unk_D0 = memory_pool_range_take(0, 0x200);
    memory_move_overlap(D_80088B78[found].unk_D0, data, 0x200);
    D_80088B78[found].unk_D4 = D_80088B78[index].unk_D4;
    D_80088B78[found].flags = 3;
    return found;
}
