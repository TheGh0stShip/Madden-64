#include "types.h"

typedef struct {
    void *title;
    void *text;
    void *unk08;
    void *yes;
    void *no;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Dialog;

typedef struct {
    u8 pad00[0x18];
    s16 unk18;
    s16 unk1A;
    s8 unk1C;
    u8 pad1D;
    s8 unk1E;
} Panel;

typedef struct {
    u8 pad00[0xC];
    Panel *unkC;
} Holder;

typedef struct {
    u8 pad00[0x24];
    Holder *unk24;
    u8 pad28[0x60 - 0x28];
    u16 *unk60;
} Screen;

typedef struct {
    s8 count;
    u8 pad01[0x9C4 - 1];
    u16 a[117];
    u16 b[18];
} Season;

extern u16 D_80080CFC[];
extern s32 D_800892E0[];
extern s32 D_800892E4[];
extern u8 D_800C2AA0[];
extern u8 D_800C2AC4[];
extern u8 D_800C2AD8[];
extern u8 D_800C2AE8[];
extern u8 D_800C2B00[];
extern Season D_800C509C;
extern u16 D_800C5C34;
extern s16 D_800C5C36;

void func_80016FF4(s32);
s32 func_80024B90(u16);
void func_8003A2C8(u16);
void func_8003A55C(u16);
s32 func_8003FBF8(u16, s32);
void func_800AF0DC(Screen *, u16, s32);
void func_800B06F4(Screen *);
void func_800B07D4(Screen *);
s16 func_800B0ABC(Dialog *, s16);
s16 func_800D6454(Dialog *);
void func_800D67B8(Dialog *);
void func_800DB2A4(Panel *);

void func_800B07F8(Screen *screen, u16 team) {
    Dialog dialog;
    s32 ok;
    s32 valid;
    Panel *panel;
    s32 n;
    s32 i;
    Panel *pp;

    panel = screen->unk24->unkC;
    ok = 1;
    if (D_80080CFC[team] == 0xFFFF) {
        return;
    }
    if (D_800C5C36 == 0 && func_8003FBF8(D_80080CFC[team], 0) != 0xB) {
        ok = 0;
        func_800D67B8(&dialog);
        dialog.title = D_800C2AC4;
        dialog.text = D_800C2AA0;
        func_800D6454(&dialog);
    }
    valid = (u8)ok;
    if (valid != 1) {
        return;
    }
    if ((u8)func_80024B90(D_80080CFC[team]) != 0xFF) {
        ok = 0;
        func_800D67B8(&dialog);
        dialog.title = D_800C2AD8;
        dialog.text = D_800C2AE8;
        dialog.unk08 = D_800C2B00;
        func_800D6454(&dialog);
    }
    if (ok != valid) {
        return;
    }
    if (func_800B0ABC(&dialog, team) != 0) {
        return;
    }
    func_80024B90(D_80080CFC[team]);
    if (D_800C5C36 == 0) {
        n = D_800C509C.count;
        if (n >= 0x12) {
            n = 0x11;
        }
        for (i = 0; i < n; i++) {
            if (D_800C509C.a[i] == D_80080CFC[team]) {
                D_800C509C.a[i] = 0x1F3F;
            }
            if (D_800C509C.b[i] == D_80080CFC[team]) {
                D_800C509C.b[i] = 0x1F3F;
            }
        }
        if (D_800C509C.count >= 0x14 && D_800C5C34 == D_80080CFC[team]) {
            D_800C5C34 = 0x1F3F;
        }
    }
    func_8003A2C8(D_80080CFC[team]);
    func_8003A55C(D_80080CFC[team]);
    func_800B07D4(screen);
    func_800B06F4(screen);
    func_800AF0DC(screen, *screen->unk60, 0xB);
    func_800DB2A4(panel);
    if (*screen->unk60 == 0) {
        pp = screen->unk24->unkC;
        pp->unk18 = 1;
        pp->unk1A = 0;
        pp->unk1C = 1;
        pp->unk1E = 1;
        func_80016FF4(D_800892E4[0]);
        func_80016FF4(D_800892E0[0]);
    }
}
