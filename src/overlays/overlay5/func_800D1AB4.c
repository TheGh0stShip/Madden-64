#include "types.h"

typedef struct {
    u8 unk_00[0x14];
    s32 unk_14;
} Object;

typedef struct {
    u8 unk_00[0x24];
    Object *unk_24;
} Player;

typedef struct {
    u8 unk_00[0x24];
    Object *unk_24;
    u8 unk_28[0x88];
} Official;

extern Player *D_80085040[2][22];
extern Official D_80087138[8];
extern Object *D_80086178;
extern Object *D_80087AD0[8];
extern Object *D_80086C40[9];
extern Object *D_8008794C;
extern Object *D_80088480;

void func_800D1AB4(s32 mask, u8 set)
{
    u32 i;
    u32 j;
    Player *p;
    Official *official;

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 11; j++) {
            p = D_80085040[i][j];
            if (!set) {
                p->unk_24->unk_14 &= mask;
            } else {
                p->unk_24->unk_14 |= mask;
            }
        }
    }
    for (i = 0; i < 8; i++) {
        official = &D_80087138[i];
        if (!set) {
            official->unk_24->unk_14 &= mask;
        } else {
            official->unk_24->unk_14 |= mask;
        }
    }
    if (!set) {
        D_80086178->unk_14 &= mask;
    } else {
        D_80086178->unk_14 |= mask;
    }
    if (!(mask & 1)) {
        for (i = 0; i < 8; i++) {
            if (D_80087AD0[i] != 0) {
                if (!set) {
                    D_80087AD0[i]->unk_14 &= mask;
                } else {
                    D_80087AD0[i]->unk_14 |= mask;
                }
            }
        }
        for (i = 0; i < 9; i++) {
            if (D_80086C40[i] != 0) {
                if (!set) {
                    D_80086C40[i]->unk_14 &= mask;
                } else {
                    D_80086C40[i]->unk_14 |= mask;
                }
            }
        }
    }
    if (D_8008794C != 0) {
        if (!set) {
            D_8008794C->unk_14 &= mask;
        } else {
            D_8008794C->unk_14 |= mask;
        }
    }
    if (D_80088480 != 0) {
        if (!set) {
            D_80088480->unk_14 &= mask;
        } else {
            D_80088480->unk_14 |= mask;
        }
    }
}
