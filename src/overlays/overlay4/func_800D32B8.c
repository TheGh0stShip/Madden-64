#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 unk_14;
} Sub;

typedef struct {
    u8 pad0[0xC];
    s16 unk_0C;
    u8 padE[0x24 - 0xE];
    Sub *unk_24;
    u16 unk_28;
    u8 pad2A[0x65 - 0x2A];
    u8 unk_65;
    u8 pad66;
    u8 unk_67;
    u8 pad68[0x90 - 0x68];
    s32 unk_90;
    s32 unk_94;
    s32 unk_98;
    s32 unk_9C;
} Obj;

extern u16 D_8008A5B4;
void func_800C16A0(Obj *, s32);

s32 func_800D32B8(Obj *arg0) {
    if ((arg0->unk_90 -= D_8008A5B4) > 0) {
        arg0->unk_24->unk_14 &= ~0x20;
    } else {
        arg0->unk_90 += (arg0->unk_0C >> 5) + 11;
    }
    if ((arg0->unk_98 -= D_8008A5B4) > 0) {
        return 0;
    } else {
        arg0->unk_98 += arg0->unk_67;
        if (--arg0->unk_9C < 0) {
            arg0->unk_28 &= ~0x10;
            arg0->unk_24->unk_14 &= ~0x10000;
            return 1;
        } else {
            arg0->unk_94 = (arg0->unk_94 + arg0->unk_65) & 7;
            func_800C16A0(arg0, arg0->unk_94 << 9);
            return 0;
        }
    }
}
