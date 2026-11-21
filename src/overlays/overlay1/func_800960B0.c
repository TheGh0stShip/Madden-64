#include "types.h"

typedef struct {
    u8 *unk_00;
    s16 unk_04;
    u8 pad06[0x214C - 6];
} Slot;

typedef struct {
    s32 unk_00;
    u8 *unk_04[1];
} Table;

typedef struct {
    s32 members[22];
} ObjectGroup;

extern s16 D_8006B7AA;
extern s16 D_8006B7AC;
extern s16 D_8006B7BC;
extern s16 D_8006B7BE;
extern s32 D_80080C10;
extern s32 D_80080C1C;
extern s8 D_80080C22;
extern Slot D_80082DBC[];
extern s8 D_80085026;
extern ObjectGroup D_80085040[];
extern u16 D_80085280;
extern s16 D_800869D6;
extern s16 D_80086C24[];
extern u16 D_80086CA0;
extern s16 D_80086CB0;
extern u16 D_80086CBC;
extern s8 D_80086DDC[];
extern u16 D_800876E8;
extern s16 D_80087758;
extern s16 D_80087AF0;
extern s32 D_800880C8;
extern s16 D_800886E0;
extern s32 D_80088714;
extern s16 D_80088AE4;
extern s16 D_800892D0;
extern s16 D_80089320;
extern s16 D_80089354;
extern s16 D_800894FC;
extern Table *D_800895DC;
extern s16 D_8008A71E;
extern s8 D_8008B618;

void func_80022354(u16);
void func_8003890C(void);
void func_80091880(void);
void func_80093F14(void);
s32 func_8009C900(s32, s32);
void func_8009C99C(void);
s32 func_800B7DD8(s32, s32, s32, s32, s32);
s32 func_800BEE28();
void func_800BF1C8(void);
void func_800C1EB8(void);
s16 func_800DD524(s32);
s32 func_800DD6EC();

void func_800960B0(void) {
    s16 *mode;

    D_80088714 = 0;
    D_80087AF0 = -1;
    D_80080C22 = 1;
    D_800880C8 = 0;
    D_80085026 = 0;
    D_8008B618 = 0;
    D_80086C24[D_80088AE4] = 0x28;
    D_80086C24[D_800886E0] = 0x50;
    D_80080C10 = (D_80080C10 | 0x800) & 0xF41F7E36;
    D_80086CA0 += 2;
    if ((s16)D_80086CA0 > 10) {
        D_80086CA0 = 10;
    }
    D_80086CB0 = -1;
    D_800876E8 = 0;
    D_800869D6 = D_80087758 - 3;
    if (D_80089320 != -1) {
        D_80089354 = 0;
    } else {
        D_80089354 = 0;
        if (D_800869D6 <= 0) {
            D_800869D6 = 7;
            func_8009C900(10, 1);
            func_8009C99C();
        }
    }
    func_800BEE28();
    func_800DD6EC();
    if (D_800892D0 == 0 && D_80089320 != -1 && !(D_80085280 & 0xC0)) {
        D_8006B7AC = func_800DD524(0);
        D_8006B7BE = -1;
        D_80082DBC[D_800886E0].unk_04 = *D_800895DC->unk_04[D_8006B7AC & 0x1FFF] & 0x1F;
        func_80093F14();
    }
    mode = &D_8006B7AA;
    if (*mode == -1) {
        *mode = 6;
    }
    if (D_8006B7AC == -1) {
        D_8006B7AC = D_80086CBC;
    }
    if (D_80089320 == -1 && !(D_80080C10 & 0x10000000)) {
        if (*mode == 0x59) {
            D_8006B7BC = 0x27;
        } else {
            D_8006B7BC = 9;
        }
        if (D_8006B7AC == 0x55) {
            D_8006B7BE = 0x24;
        } else {
            D_8006B7BE = 6;
        }
    }
    if (D_800892D0 == 0) {
        if (D_80086DDC[D_800886E0] != 1) {
            D_80086DDC[D_800886E0] = 0;
        }
        D_80086DDC[D_80088AE4] = 0;
    } else {
        D_80085026 = 1;
    }
    D_80080C1C = 0;
    D_800894FC = 0;
    D_80082DBC[D_80088AE4].unk_00 = D_800895DC->unk_04[D_8006B7AA & 0x1FFF];
    D_80082DBC[D_800886E0].unk_00 = D_800895DC->unk_04[D_8006B7AC & 0x1FFF];
    func_8003890C();
    if (D_800892D0 == 0) {
        func_80022354(D_80088AE4);
        func_80022354(D_800886E0);
    }
    func_800BF1C8();
    func_800C1EB8();
    func_80091880();
    if (D_80089320 == -1) {
        if (D_8006B7AC != 0x55) {
            func_800B7DD8(2, 0xD, D_80085040[D_800886E0].members[0], 0, 0);
        } else {
            func_800B7DD8(2, 0xE, D_80085040[D_800886E0].members[0], 0, 0);
        }
    }
    D_8008A71E = 0;
}
