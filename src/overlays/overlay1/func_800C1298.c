#include "types.h"

typedef struct {
    u8 pad0[0x1E];
    u8 unk_1E;
    u8 unk_1F;
    u8 pad20;
    u8 unk_21;
    u8 pad22[0xA];
    s32 unk_2C;
} Player;

typedef struct {
    u8 pad0[0x3C];
    u16 unk_3C;
} Obj;

void func_80096A00(s32, u16);
void func_80097578(s32, s32);
extern s8 D_80085E50[];
extern u8 D_80085E58;
extern s32 D_80086C40[];
extern s32 D_80086C60;
extern s32 D_80087AD0[];
extern u8 D_80088076;
extern s16 D_8008807C;
extern Player *D_800880F0[];
extern s16 D_80089308[];
extern s32 D_80089490[];
extern Player *D_8008A058;
extern u16 D_8008B1F8[];
extern u16 D_8008B206;

void func_800BCB74(Obj *arg0) {
    u16 i;
    s32 *p;
    Player *pl;

    D_80085E50[arg0->unk_3C] = -1;
    for (i = 0; i < 4; i++) {
        func_80096A00(D_80086C40[i], D_8008B1F8[D_80089308[i]]);
        func_80097578(D_80087AD0[i], D_80086C40[i]);
    }
    if (D_8008807C == 1) {
        if (arg0->unk_3C != 8) {
            for (p = D_80089490; *p != -1; p++) {
                if (arg0->unk_3C == *p) {
                    pl = D_800880F0[arg0->unk_3C];
                    if (pl == 0) {
                        return;
                    }
                    D_80085E50[arg0->unk_3C] = (pl->unk_1E == 0) ? pl->unk_1F : pl->unk_1F + 0xB;
                    pl = D_800880F0[*p];
                    if (pl == D_8008A058 && (u32) (pl->unk_2C - 0xB) >= 2) {
                        D_80085E50[arg0->unk_3C] = -1;
                        func_80096A00(D_80086C60, D_8008B1F8[D_80089308[arg0->unk_3C]]);
                        D_80088076 = arg0->unk_3C;
                    }
                    return;
                }
            }
        } else {
            pl = D_8008A058;
            if (pl != 0 && (u32) (pl->unk_2C - 0xB) >= 2) {
                if (!(pl->unk_21 & 0xC0)) {
                    func_80096A00(D_80086C60, D_8008B206);
                    D_80088076 = 8;
                }
                pl = D_8008A058;
                D_80085E58 = (pl->unk_1E == 0) ? pl->unk_1F : pl->unk_1F + 0xB;
            }
        }
    }
}
