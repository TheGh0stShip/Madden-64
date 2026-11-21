#include "types.h"

typedef struct {
    u8 pad0[0x14];
    u32 unk_14;
    u8 pad18[0x8];
    s32 unk_20;
} Child;

typedef struct {
    u8 pad0[0x24];
    Child *unk_24;
    u16 unk_28;
    u8 pad2A[0x8C - 0x2A];
    s32 unk_8C;
} Object;

extern u16 D_8008A5B4;

s32 func_800D4C14(Object *obj) {
    obj->unk_24->unk_14 &= ~0x20;
    obj->unk_8C = D_8008A5B4 + obj->unk_8C;
    if (obj->unk_8C < 61 && obj->unk_24->unk_20 <= 0x03700000) {
        return 0;
    }
    obj->unk_28 &= ~0x10;
    obj->unk_24->unk_14 &= ~0x10000;
    return 1;
}
