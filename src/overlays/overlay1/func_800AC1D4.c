#include "types.h"


typedef struct {
    u8 pad00[0x1C];
    s32 unk1C;
    s32 unk20;
} Sprite;

typedef struct {
    s32 unk0;
    u8 pad04[0x24];
} Slot28;

typedef struct {
    s32 unk0;
    u8 pad04[0x2148];
} Team;

extern u16 D_8006B7A8;
extern u16 D_8006B7B8;
extern u16 D_8006B7BA;
extern s16 D_8006B7BC;
extern s32 D_8006B7CC;
extern s32 D_8006B7D0;
extern s32 D_8006B7DC;
extern s32 D_8006B7E0;
extern u8 D_8006B7EC[];
extern s32 D_8006B7F0[2];
extern s32 D_8006B854;
extern s32 D_8006B884;
extern s32 D_8006B88C;
extern Slot28 D_80072E04[];
extern char D_8007A0C4[];
extern s32 D_8007A0D0;
extern Sprite *D_8007A0FC;
extern Sprite *D_8007A100;
extern Sprite *D_8007A104;
extern void *D_8007A108;
extern void *D_8007A10C;
extern void *D_8007A110;
extern void *D_8007A114;
extern s16 D_8007A11C;
extern s16 D_8007A11E;
extern u16 D_8007A12A;
extern u16 D_8007A148[];
extern u16 D_8007A154[];
extern u16 D_8007A156;
extern u16 D_8007A158;
extern u16 D_8007A15A;
extern s16 D_8007A15C;
extern s16 D_8007A15E;
extern u16 D_8007A164;
extern s16 D_8007A168;
extern s32 D_80080C10;
extern s16 D_80082D96;
extern Team D_80082DCC[];
extern s16 D_80084EE2;
extern s32 D_80084F34;
extern u16 D_80085280;
extern u16 D_800857B2;
extern s16 D_80087AAC;
extern s16 D_800886E0;
extern s16 D_80088AE4;
extern volatile u16 D_8008A5B4;

void func_8000CDC0(void);
void func_8000D834(s32, s32);
void func_800167FC(s16, char *);
void func_800174EC(s32);
s32 func_8001AEA8(u8 *);
void func_8003190C(s32);
u16 func_80031A1C(s32);
void func_800334B8(void);
s32 func_800A82B0(s32, s32);
void func_800A84E0(u16, u16);
void func_800A9330(u16, u16);
void func_800A94A0(void);
void func_800AAC40(void);
s32 func_800AAED4(s32);
void func_800DD6EC(void);

void func_800AC1D4(void) {
    s32 count;
    u32 i;

    count = D_8008A5B4;
    if (D_8007A168 == 0) {
        func_800AAC40();
        D_8007A0D0 = func_8001AEA8(D_8006B7EC);
        func_800DD6EC();
        if (D_80088AE4 == 1) {
            D_8007A158 = D_8006B7B8;
            D_8007A15A = D_8006B7BA;
        } else {
            D_8007A15A = D_8006B7B8;
            D_8007A158 = D_8006B7BA;
        }
        func_8000CDC0();
        func_800334B8();
        func_800A94A0();
        if (D_80088AE4 == 0) {
            D_8006B7CC = func_800AAED4(9);
            D_8006B7D0 = func_800AAED4(8);
            func_800167FC(D_80082D96, D_8007A0C4 + 3);
            func_800167FC(D_80084EE2, D_8007A0C4);
        } else {
            D_8006B7CC = func_800AAED4(8);
            D_8006B7D0 = func_800AAED4(9);
            func_800167FC(D_80082D96, D_8007A0C4);
            func_800167FC(D_80084EE2, D_8007A0C4 + 3);
        }
        if ((D_800857B2 & 0xC0) == 0x40) {
            if (D_8007A156 != 0) {
                D_8006B7E0 = D_80072E04[D_8007A12A].unk0;
            } else {
                D_8006B7E0 = 0;
            }
        } else if (D_8006B7BC >= 0) {
            D_8006B7E0 = D_80072E04[D_8006B7BC].unk0;
        } else {
            D_8006B7E0 = 0;
        }
        D_8006B7DC = 0;
        for (i = 0; i < 2; i++) {
            func_800A84E0(D_8007A148[i], i);
            func_800A9330(i, D_8007A154[i]);
        }
        D_8006B7F0[0] = D_80082DCC[D_800886E0].unk0;
        D_8006B7F0[1] = D_80082DCC[D_80088AE4].unk0;
        if ((D_80085280 & 0xC0) == 0x40) {
            (*(s32 *)((u8 *)D_8007A108 + 0x14)) |= 1;
            (*(s32 *)((u8 *)D_8007A110 + 0x14)) |= 1;
        } else {
            (*(s32 *)((u8 *)D_8007A108 + 0x14)) &= ~1;
            (*(s32 *)((u8 *)D_8007A110 + 0x14)) &= ~1;
            D_8007A11C = 2;
        }
        if ((D_800857B2 & 0xC0) == 0x40) {
            (*(s32 *)((u8 *)D_8007A10C + 0x14)) |= 1;
            (*(s32 *)((u8 *)D_8007A114 + 0x14)) |= 1;
        } else {
            (*(s32 *)((u8 *)D_8007A10C + 0x14)) &= ~1;
            (*(s32 *)((u8 *)D_8007A114 + 0x14)) &= ~1;
            D_8007A11E = 2;
            if (D_8006B7A8 != 3) {
                if (D_80080C10 & 0x20) {
                    D_8007A164 = 60;
                } else if ((D_80080C10 & 0x1200) == 0x1200 && D_80087AAC >= 14) {
                    D_8007A164 = 630;
                } else {
                    D_8007A164 = 270;
                }
                D_8007A164 += func_80031A1C(180);
            }
        }
        if (D_80084F34 < 0) {
            func_800174EC(D_8006B854);
        }
        func_8000D834(D_8006B884, D_8006B88C);
        D_8007A168++;
    } else {
        while (count > 0) {
            D_8007A0FC->unk20 = func_800A82B0(D_8007A0FC->unk20, 0);
            D_8007A104->unk1C = func_800A82B0(D_8007A104->unk1C, 0);
            D_8007A100->unk20 = func_800A82B0(D_8007A100->unk20, 0);
            count--;
        }
        count = D_8007A0FC->unk20;
        count |= D_8007A104->unk1C;
        count |= D_8007A100->unk20;
        if (count == 0) {
            D_8006B7A8 = 2;
            func_8003190C(0xDF0E);
            D_8007A15E = 0;
            D_8007A15C = 0;
        }
    }
}
