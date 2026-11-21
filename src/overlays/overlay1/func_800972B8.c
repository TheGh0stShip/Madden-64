#include "types.h"

typedef struct {
    u8 pad0[0x28];
} PlayEntry;

typedef struct {
    u8 pad0[0x84];
} PlayData;

typedef struct {
    PlayEntry *entry;
    PlayData *data;
    s32 play;
    s16 index;
    u8 padE[0x213E];
} TeamPlay;

typedef struct {
    s32 count;
    s32 plays[1];
} PlayTable;

typedef struct {
    u8 pad0[0x4];
    s32 unk_4;
    s32 unk_8;
} Formation;

s16 func_800DD28C(s32);
s16 func_800DD524(s32);
extern s16 D_8006B7AA[];
extern s16 D_8006B7AC;
extern s16 D_8006B7BC[];
extern s16 D_8006B7BE;
extern Formation *D_80072720[];
extern s32 D_80080C10;
extern TeamPlay D_80082DB4[];
extern u16 D_80085280;
extern u16 D_800857B2;
extern s8 D_80085BFA;
extern s16 D_80086CBC;
extern PlayData *D_80087894;
extern s32 D_800878A8[];
extern PlayEntry *D_80088094;
extern s16 D_80088AE4;
extern s16 D_800892D0;
extern PlayTable *D_800895DC;
extern s8 D_8008B2A8[];
extern s8 D_8008B618;

void func_80092B94(void) {
    s16 play;
    s16 k;
    Formation *form;
    s32 mask;

    if (!(D_800857B2 & 0xC0)) {
        play = func_800DD28C(0);
        if (play != 0xFE) {
            D_8006B7AA[0] = play;
            D_80082DB4[D_80088AE4].play = D_800895DC->plays[play & 0x1FFF];
            if (play != 0x11) {
                D_8006B7BC[0] = func_800DD28C(1);
            } else {
                D_8006B7BC[0] = 0;
                D_80082DB4[D_80088AE4].index = 0;
                D_800892D0 = 1;
                D_8008B618 = 0;
                D_80082DB4[D_80088AE4].play = D_800895DC->plays[D_8006B7AA[0] & 0x1FFF];
                D_80082DB4[D_80088AE4].data = D_80087894 + D_80082DB4[D_80088AE4].index;
                D_80082DB4[D_80088AE4].entry = D_80088094 + D_80082DB4[D_80088AE4].index;
            }
        } else {
            D_800892D0 = 1;
        }
    } else {
        k = D_800857B2 & 0xFF3F;
        form = D_80072720[D_8008B2A8[k]];
        mask = D_800878A8[k];
        if (mask & form->unk_8) {
            if (D_8006B7AA[0] != -1) {
                if ((D_80080C10 & 0x200) || D_80085BFA == 2) {
                    D_800892D0 = 1;
                }
            }
        } else if (mask & form->unk_4) {
            if (D_8006B7AA[0] != -1) {
                if ((D_80080C10 & 0x200) || D_80085BFA == 2) {
                    D_8006B7AA[0] = 0x11;
                    D_8006B7BC[0] = 0;
                    D_80082DB4[D_80088AE4].index = 0;
                    D_8008B618 = 0;
                    D_800892D0 = 1;
                    D_80082DB4[D_80088AE4].play = D_800895DC->plays[D_8006B7AA[0] & 0x1FFF];
                    D_80082DB4[D_80088AE4].data = D_80087894 + D_80082DB4[D_80088AE4].index;
                    D_80082DB4[D_80088AE4].entry = D_80088094 + D_80082DB4[D_80088AE4].index;
                }
            }
        } else {
            play = func_800DD28C(0);
            if (play != 0xFE) {
                D_8006B7AA[0] = play;
                D_80082DB4[D_80088AE4].play = D_800895DC->plays[play & 0x1FFF];
            } else {
                D_8006B7AA[0] = -1;
            }
            D_8006B7BC[0] = -1;
        }
    }
    if (D_800892D0 == 0) {
        if (!(D_80085280 & 0xC0)) {
            if (!(D_80080C10 & 0x10000000)) {
                D_8006B7AC = func_800DD524(0);
                D_8006B7BE = -1;
            } else {
                D_8006B7AC = 0xB7;
            }
        } else {
            D_80086CBC = func_800DD524(0);
            D_8006B7AC = -1;
            D_8006B7BE = -1;
        }
    }
}
