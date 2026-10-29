#include "types.h"

typedef struct { u8 pad[0x28]; u16 unk28; u8 pad2A[0x66-0x2A]; u8 unk66; u8 pad67[0x8C-0x67]; s32 unk8C; } Obj800D903C;
extern s32 D_80080C10;

s32 func_800D903C(Obj800D903C *a0) {
    if (!(a0->unk28 & 1)) {
        if (D_80080C10 & 1) {
            a0->unk8C = (a0->unk66 << 5) + 0x7FF;
        } else {
            a0->unk8C = a0->unk66 << 5;
        }
    }
    return 0;
}
