#include "types.h"

typedef struct {
    u8 pad0[0x1C];
    s16 unk_1C;
    u8 pad1E[2];
    s16 unk_20;
} Rect800DB118;

typedef struct {
    u8 pad0[0x24];
    Rect800DB118 *unk_24;
} Obj800DB118;

void func_800DB060(u16 arg0, s16 *arg1);
void func_800DB0BC(u16 arg0, s16 *arg1);

s32 func_800DB118(s32 arg0, Obj800DB118 *arg1, u16 arg2) {
    s16 lo[4];
    s16 hi[4];

    func_800DB060(arg2, lo);
    func_800DB0BC(arg2, hi);
    if (lo[0] < arg1->unk_24->unk_1C && arg1->unk_24->unk_1C < hi[0] && arg1->unk_24->unk_20 < lo[1] && hi[1] < arg1->unk_24->unk_20) {
        return 1;
    }
    return 0;
}
