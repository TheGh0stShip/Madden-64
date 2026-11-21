#include "types.h"

typedef void (*RowFunc)(u16, void *, s32);
typedef void (*RowFuncAll)(u32, u32, void *, s32);

typedef struct {
    u8 unk_00[0xA];
    u16 unk_0A;
    u8 unk_0C;
    u8 unk_0D;
    u8 unk_0E[0xC];
    u16 unk_1A;
    u8 unk_1C;
    u8 unk_1D;
    u8 unk_1E;
    u8 unk_1F;
    RowFunc *unk_20;
    u8 *unk_24;
    u8 *unk_28;
    u8 unk_2C[2];
    u8 unk_2E;
    u8 unk_2F[0xD];
    void **unk_3C;
    void **unk_40;
    void *unk_44;
    u8 unk_48[4];
    s32 unk_4C;
} RowList;

extern u32 D_8007A418;

void overlay5_runtime_index_ranges_swap(void *owner, s32 first, s32 second, u32 count, s32 stride);
void func_8001EC20(void *, u32);

void func_800DBF10(RowList *list, s32 delta) {
    RowFuncAll first;
    RowFunc *funcs;
    RowFunc fn;
    u32 row;
    u32 i;
    u32 slot;
    u32 j;

    row = delta + list->unk_0A;
    funcs = list->unk_20;
    first = (RowFuncAll)funcs[0];
    for (i = 0; i < list->unk_1C; i++) {
        slot = list->unk_28[i];
        D_8007A418 = i;
        if (i >= list->unk_1E) {
            D_8007A418 = i + list->unk_1A;
        }
        fn = funcs[D_8007A418];
        if (list->unk_24[i] != 0) {
            if (delta != 0) {
                overlay5_runtime_index_ranges_swap(list->unk_44, slot + 1, slot, list->unk_0C - 1, 1);
            } else {
                overlay5_runtime_index_ranges_swap(list->unk_44, slot + list->unk_0C - 2, slot + list->unk_0C - 1, list->unk_0C - 1, -1);
            }
            slot = list->unk_28[i] + delta;
            if (list->unk_2E & 0x40) {
                first(row, D_8007A418, list->unk_3C[slot], list->unk_4C);
            } else {
                fn(row, list->unk_3C[slot], list->unk_4C);
            }
            func_8001EC20(list->unk_44, slot);
        } else {
            if (delta != 0) {
                for (j = list->unk_28[i]; j < list->unk_28[i] + delta; j++) {
                    list->unk_40[j] = list->unk_40[j + 1];
                }
            } else {
                for (j = list->unk_28[i] + list->unk_0C - 1; list->unk_28[i] < j; j--) {
                    list->unk_40[j] = list->unk_40[j - 1];
                }
            }
            slot = list->unk_28[i] + delta;
            if (list->unk_2E & 0x40) {
                first(row, D_8007A418, &list->unk_40[slot], list->unk_4C);
            } else {
                fn(row, &list->unk_40[slot], list->unk_4C);
            }
        }
    }
}
