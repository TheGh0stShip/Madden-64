#include "types.h"

typedef struct {
    u16 flags;
    s16 unk_02;
    s32 unk_04;
} Entry;

extern Entry D_80086DE8[];
extern s32 D_8006B8FC;
extern s32 D_80087AA8;
extern s32 D_8008931C;
void func_8000D874(s32, s32);
void func_8000D834(s32, s32);

void func_800AF4CC(s16 index) {
    s32 flags = D_80086DE8[index].flags;

    D_80086DE8[index].unk_02 = -1;
    if ((flags & 2) && (s16)flags != -1) {
        func_8000D874(D_80087AA8, D_80086DE8[index].unk_04);
        func_8000D834(D_8008931C, D_80086DE8[index].unk_04);
    } else {
        func_8000D874(D_8006B8FC, D_80086DE8[index].unk_04);
        func_8000D834(D_8008931C, D_80086DE8[index].unk_04);
    }
}
