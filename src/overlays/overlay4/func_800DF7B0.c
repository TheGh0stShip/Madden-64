#include "types.h"

typedef struct { u8 unk0; u8 pad1[0x2104 - 1]; u16 unk2104; u16 unk2106; u8 pad2108[0x212C - 0x2108]; u8 *unk212C; u16 unk2130; u8 pad2132[0x214C - 0x2132]; } TeamData;
typedef struct { s32 x; s32 y; } Pos2;
extern TeamData D_80080C90[];
extern s16 D_80088AE4;
extern s16 D_800886E0;
extern s16 D_80089320;
extern s32 D_8008793C;
extern Pos2 D_80084F30;
extern s16 D_800876DC;
extern u16 D_80087AAC;
extern s16 D_80087A60;
extern u16 D_80087758;
extern u16 D_800892D0;
extern s32 D_80080C10;
typedef struct { u16 a; u16 b; } Pair;
extern Pair D_8006B7AA;
extern u16 D_80087768;
extern u16 D_800880B0;
extern s32 D_800880B8;
extern s32 D_80087770;
extern s16 D_8008777E;
extern u16 D_8008777C;
extern u16 D_800880C4;
extern u16 D_800880C6;
extern u16 *func_800209AC(void);
typedef struct { s16 u5A8; s16 u5AA; s16 u5AC; s16 u5AE; s16 u5B0; s16 u5B2; s16 u5B4; s16 u5B6; s16 u5B8; s16 u5BA; s16 u5BC; s16 u5BE; s16 u5C0; s16 u5C2; s16 u5C4; s16 u5C6; s16 u5C8; s16 u5CA; s16 u5CC; s16 u5CE; s16 u5D0; s16 u5D2; s16 u5D4; s16 u5D6; s16 u5D8; s16 u5DA; s16 u5DC; s16 u5DE; } Info;
extern Info D_800885A8;
extern u16 func_80031A1C(s32);

void func_800DF7B0(a)
    s16 a;
{
    u16 c, d;

    D_800885A8.u5A8 = D_80080C90[D_80088AE4].unk2106;
    D_800885A8.u5AA = D_80080C90[D_800886E0].unk2106;
    D_800885A8.u5AC = D_80080C90[D_80088AE4].unk2104 - D_80080C90[D_800886E0].unk2104;
    switch (D_80089320) {
    case -1:
        D_800885A8.u5AE = 1;
        D_800885A8.u5C8 = 1;
        D_800885A8.u5CA = 0;
        break;
    case 0:
        D_800885A8.u5AE = 4;
        D_800885A8.u5C8 = 0;
        D_800885A8.u5CA = 1;
        break;
    default:
        D_800885A8.u5C8 = 0;
        D_800885A8.u5CA = 0;
        D_800885A8.u5AE = D_80089320;
        break;
    }
    D_800885A8.u5B0 = (D_8008793C - D_80084F30.y) >> 20;
    D_800885A8.u5B2 = 0x32 - (D_80084F30.y >> 20);
    D_800885A8.u5B4 = D_800876DC;
    D_800885A8.u5BA = D_800885A8.u5B8 = D_800885A8.u5B6 = D_80087AAC;
    switch (D_800876DC) {
    case 1:
        D_800885A8.u5BA += D_80087A60 * 3;
        D_800885A8.u5B8 += D_80087A60;
        break;
    case 2:
        D_800885A8.u5BA += D_80087A60 * 2;
        break;
    case 3:
        D_800885A8.u5BA += D_80087A60;
        D_800885A8.u5B8 += D_80087A60;
        break;
    case 4:
    case 5:
        break;
    }
    D_800885A8.u5BC = func_80031A1C(100);
    D_800885A8.u5BE = func_80031A1C(100);
    D_800885A8.u5C0 = D_80087758;
    D_800885A8.u5C2 = D_80084F30.x >> 16;
    D_800885A8.u5C4 = 0;
    D_800885A8.u5CE = 0;
    D_800885A8.u5CC = D_800892D0;
    if (D_80080C10 & 0x200) {
        D_800885A8.u5C6 = 1;
    } else {
        D_800885A8.u5C6 = 0;
    }
    D_800885A8.u5D0 = D_80080C90[D_800886E0].unk2130;
    D_800885A8.u5D2 = D_80080C90[D_80088AE4].unk0;
    D_800885A8.u5D4 = D_8006B7AA.a;
    D_800885A8.u5D6 = D_8006B7AA.b & 0x1FFF;
    switch (a) {
    case 4:
            D_800885A8.u5CE = *func_800209AC();
            D_800885A8.u5D8 = D_80087768 - D_800880B0;
            D_800885A8.u5DA = (D_800880B8 - D_80087770 + 0x80000) >> 20;
            D_800885A8.u5DC = D_800885A8.u5AE;
            if (D_80089320 >= 2 && D_8008777E > 0) {
                D_800885A8.u5DC = D_8008777E;
            }
            c = D_8008777C;
            d = D_800880C4;
            D_800885A8.u5DE = 0;
            if ((c | d) & 6) {
                if (D_80080C10 & 1) {
                    if (c & 2) {
                        D_800885A8.u5DE = 1;
                    }
                } else if (!(c & 4) && (d & 4)) {
                    D_800885A8.u5DE = 1;
                }
            }
            D_800885A8.u5AE = D_800880C6;
            if (D_800880C4 & 8) {
                D_800885A8.u5AE = 1;
            }
        break;
    case 1:
            D_800885A8.u5D0 = D_80080C90[D_80088AE4].unk212C[0] & 0x1F;
            D_800885A8.u5D2 = D_80080C90[D_80088AE4].unk0;
        break;
    }
}
