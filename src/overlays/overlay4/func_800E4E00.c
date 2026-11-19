#include "m2c.h"

typedef struct { u8 pad[0x28]; u16 flags; u8 pad2[6]; s16 rating; u8 pad3[0x32]; u8 pos; u8 pad4[0x27]; s32 time; s32 unk90; s32 unk94; } Player;
u16 func_80031A1C(s32);
s32 func_800E4E00(Player *p) {
    p->flags |= 0x10;
    p->time = p->rating + 5;
    if (p->time < 20) {
        p->time = 20;
    }
    if (p->time > 80) {
        p->time = 80;
    }
    p->time *= 2;
    p->time += func_80031A1C(30) + 12;
    if (p->pos == 0x33 || p->pos == 0x25) {
        p->time /= 3;
    }
    p->unk90 = 0;
    p->unk94 = 0x22;
    return 0;
}
