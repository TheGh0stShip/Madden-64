#include "types.h"

typedef struct { u8 pad[0x65]; u8 unk65; u8 pad66[0x8C-0x66]; s32 unk8C; s32 unk90; } Obj800DA3B8;
extern u16 func_80031A1C(s32);
s32 func_800DA3B8(Obj800DA3B8 *a0) {
    if (a0->unk65 != 0xB) {
        a0->unk8C = 4;
    } else {
        a0->unk8C = func_80031A1C(0x1E);
    }
    a0->unk90 = 0xA;
    return 0;
}
