#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Sprite;

typedef struct {
    u8 pad00[0x14];
    u16 values[2][11];
} Track;

void func_8000BE80(void);
void func_8000BEE8(s32);
void func_8000BF08(void);
void func_8000CB78(s32, u8 *, u8 *);
s32 func_8000D740(s32, s32, s32);
void func_8000D998(s32, s32);
void func_80011308(void);
void func_80016FE4(s32);
void func_80016FF4(s32);
void func_80030050(void);
void func_80030110(void);
void func_80030910(void);
s32 func_80030B54(s16);
s32 func_80030DF0(void);
void func_80033B20(Sprite *, s32);
void func_80034388(Sprite *, s32);
void func_8003B9C0(u16, u16, u16);
void func_80098164(s32, s32);
void func_800A2FF0(void *);
void func_800A6590(u8 *, u8);
void func_800B2DF8(void *);
void func_800B3224(u8, u16, u8);
void func_800B43C0(void);
void func_800B49CC(void);
void func_800B59C0(void);
void func_800B6610(void);
void func_800B63B8(void);
void func_800B7C80(void);
void transient_mode_clear(void);
void func_800BCFBC(void);
void object_group_reset(void);
void func_800BF644(s32);

extern s32 D_8006A9B4;
extern s16 D_800718E2;
extern Track *D_800718E8;
extern s16 D_800718EC;
extern s32 D_800718F0;
extern s32 D_800718F4;
extern u8 D_8007A24B;
extern u16 D_80085280;
extern s32 D_80085D48;
extern u16 D_800857B2;
extern s32 D_80086A28;
extern Sprite *D_80086C88;
extern u8 D_80086CE8[];
extern s16 D_800876DC;
extern s32 D_8008775C;
extern Sprite *D_8008794C;
extern s32 D_80088090;
extern volatile s32 D_80088620;
extern s32 D_80089490[];
extern s16 D_80089598[];
extern s32 D_8008A058;
extern s16 D_8008A5B0;
extern volatile u16 D_8008A5B4;
extern u8 D_8008A5E0[];
extern s16 D_8008A5E6;
extern s32 D_8008A5EC;
extern u16 D_8008A664[];
extern s16 D_8008AF80;
extern u16 D_8008AFD2;
extern s32 D_8008B620[];
extern u8 D_800A3164[];

void func_800B2968(u8 arg0, u16 arg1, u8 arg2) {
    u16 done;
    s32 first;
    s32 timer;
    s32 i;
    s32 j;
    s32 buttons;
    s16 mode;

    D_800718E2 = 1;
    D_800718F0 = 1;
    func_800B43C0();
    done = 0;
    func_80016FE4(D_80086A28);
    D_8008A058 = 0;
    D_8008A5EC = 0;
    D_8008A664[0] = 0;
    D_8008A5E6 = 0;
    func_800B3224(arg0, arg1, arg2);
    first = 1;
    if (D_80086C88 != 0) {
        D_80086C88->flags |= 1;
    }
    D_8008794C->flags &= ~1;
    func_80034388(D_8008794C, 0x10A);
    func_80033B20(D_8008794C, 1);
    func_800B6610();
    D_800718EC = 0;
    for (i = 0; i < 2; i++) {
        for (j = 0; j < 11; j++) {
            func_8003B9C0(i, j, D_800718E8->values[i][j]);
        }
    }
    D_800718F4 = func_8000D740(D_8008775C, 5, 0);
    timer = 0;
    func_80098164(D_80085D48, D_800718F4);
    D_8008AF80 = 2;
    D_8008AFD2 = 0;
    func_8000BEE8(2);
    while (!done) {
        func_80030910();
        func_800B7C80();
        if (D_8006A9B4 == 0) {
            func_800B2DF8(D_8008A5E0);
        }
        func_800BF644(D_8008B620[0]);
        func_800BF644(D_8008B620[1]);
        if (!(D_80085280 & 0xC0) || !(D_800857B2 & 0xC0)) {
            buttons = func_80030DF0();
            if (buttons & 0x1000) {
                done = 1;
                transient_mode_clear();
            }
            if (D_8008A5B0 == 4 && (buttons & 0xFF3F)) {
                D_800876DC = 7;
            }
        } else {
            for (buttons = 0; buttons < 4; buttons++) {
                if (D_80089490[buttons] == -1) {
                    break;
                }
                if (D_80089598[D_80089490[buttons]] == arg0) {
                    if (func_80030B54(D_80089490[buttons]) & 0x1000) {
                        done = 1;
                        transient_mode_clear();
                        break;
                    }
                }
            }
        }
        mode = D_8008AF80;
        if (first || mode == 1) {
            timer += D_8008A5B4;
            D_8008A664[0] |= 0x100;
            if (timer >= 0x79) {
                if (mode == 1) {
                    done = 1;
                    func_80011308();
                } else {
                    timer = 0;
                    first = 0;
                    D_8008A664[0] &= ~0x100;
                }
            }
        }
        if (!done && first != 1) {
            func_800B59C0();
        }
        func_800BCFBC();
        func_800B63B8();
        func_8000BF08();
        func_80030110();
        func_80030050();
    }
    func_8000BE80();
    func_8000D998(D_8008775C, D_800718F4);
    func_80016FF4(D_80086A28);
    func_8000CB78(D_80088090, D_800A3164, D_80086CE8);
    func_800A2FF0(D_8008A5E0);
    func_800B49CC();
    func_800BCFBC();
    object_group_reset();
    D_8008AF80 = 0;
    func_8000BEE8(1);
    func_800A6590(D_80086CE8, D_8007A24B);
    timer = D_80088620;
    D_8006A9B4 = 0;
    while (timer == D_80088620) {
    }
    D_800718F0 = 0;
    D_800718E2 = 0;
}
