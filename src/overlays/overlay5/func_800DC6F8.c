#include "types.h"

typedef void (*RowFunc)();

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
    u32 *unk_3C;
    u32 *unk_40;
    s32 unk_44;
    u8 unk_48[4];
    s32 unk_4C;
} RowList;

extern u32 D_8007A418;

void func_800DB2A4(RowList *);
void func_8001EC20(s32, s32);

void func_800DC6F8(RowList *list, u8 row) {
    RowFunc first;
    RowFunc *funcs;
    RowFunc fn;
    u32 i;
    s32 idx;

    funcs = list->unk_20;
    first = funcs[0];
    if (row == list->unk_0A + list->unk_0D) {
        func_800DB2A4(list);
        return;
    }
    if (row >= list->unk_0A && row < list->unk_0A + list->unk_0C) {
        for (i = 0; i < list->unk_1C; i++) {
            D_8007A418 = i;
            if (i >= list->unk_1E) {
                D_8007A418 = i + list->unk_1A;
            }
            fn = funcs[D_8007A418];
            idx = list->unk_28[i] + row - list->unk_0A;
            if (list->unk_24[i] != 0) {
                if (list->unk_2E & 0x40) {
                    first(row, D_8007A418, list->unk_3C[idx], list->unk_4C);
                } else {
                    fn(row, list->unk_3C[idx], list->unk_4C);
                }
                func_8001EC20(list->unk_44, idx);
            } else {
                if (list->unk_2E & 0x40) {
                    first(row, D_8007A418, &list->unk_40[idx], list->unk_4C);
                } else {
                    fn(row, &list->unk_40[idx], list->unk_4C);
                }
            }
        }
    }
}
