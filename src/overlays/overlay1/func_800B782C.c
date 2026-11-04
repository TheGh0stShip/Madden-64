#include "types.h"

typedef struct {
    u8 pad00[6];
    u16 unk06;
    u16 start;
} PlayTable;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    u8 pad18[0x6C];
    s16 unk84;
    s16 unk86;
    s32 unk88;
    s32 unk8C;
    s32 unk90;
    s32 unk94;
    s32 unk98;
    s32 unk9C;
    s32 unkA0;
} ViewState;

extern PlayTable *D_800718E8;
extern u16 D_80087AC4;
extern u8 *D_80086178;
extern s32 D_80088090;
extern u8 D_800A3164[];
extern ViewState D_8008A5E0;
extern s32 D_8008B340;

void func_800B5028(u16);
void func_800B6378(u8 *);
void func_800BF1C8(void);
void func_8000CB78(s32, u8 *, ViewState *);
void func_800A2F10(ViewState *, s32, s32, s32);

void func_800B782C(void) {
    s32 *eye;

    D_80087AC4 = D_800718E8->start;
    func_800B5028(D_80087AC4);
    func_800B6378(D_80086178);
    func_800BF1C8();
    eye = &D_8008A5E0.unk88;
    *eye = *(s32 *)(D_80086178 + 0x1C);
    D_8008A5E0.unk8C = 0x04A00000;
    D_8008B340 = 1;
    if (D_800718E8->unk06 != 0) {
        D_8008A5E0.unk8C = -0x04A00000;
    }
    D_8008A5E0.unk90 = 0x00800000;
    D_8008A5E0.unk98 = 0x012C0000;
    D_8008A5E0.unk9C = 0xFF;
    D_8008A5E0.unkA0 = 0x10;
    D_8008A5E0.unk84 = 0x40;
    func_8000CB78(D_80088090, D_800A3164, &D_8008A5E0);
    D_8008A5E0.unk14 = D_80088090;
    func_800A2F10(&D_8008A5E0, 0, 8, 0);
}
