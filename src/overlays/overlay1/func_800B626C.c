#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    char text[15];
} Caption;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Window;

typedef struct {
    u8 pad00[0xC];
    s32 *font;
    Caption *caption;
    u8 pad14[8];
    s16 width;
} Banner;

extern Caption D_800015F8;
extern s32 D_8006C928;
extern Banner D_8007207C;
extern s32 D_80080C10;
extern s16 D_800857C0;
extern s16 D_800857CA;
extern s8 D_80087AF2;
extern s32 D_80088090;
extern s16 D_800892A0;
extern s8 D_800892B0;
extern s32 D_80089490;
extern Window *D_8008A3E8[];
extern s16 D_8008AF78;
extern s8 D_8008B210;

void func_8000BF08(void);
s32 func_8001AEA8(s32);
void func_8001F81C(s32, s32);
void func_8001F848(s32, s32, s32);
void func_8003190C(s32);
void func_8003C7E4(s32, s32);
void func_80041658(void);
void func_800AA370(void);
void func_800AAC40(void);
void func_800AAC94(void);
void func_800AD49C(void);
void func_800B13A4(void);
void func_800B1744(void);
void func_800B7D98(void);
void func_800BDF68(void);
void func_800DC978(s32, Banner *, s32);
void func_800DCBC4(void);
void func_800E0CFC(void);
u16 func_800E0E24(void);

void func_800B626C(void) {
    s32 saved;
    s32 i;

    func_8001F848(0, 0, 1);
    func_8001F848(1, 1, 0);
    func_8001F81C(0, 1);
    func_8001F81C(1, 0);
    if (D_800892A0 == 0 && D_80089490 != -1) {
        D_80080C10 |= 0x10000;
        func_800B7D98();
        func_80041658();
        if (D_800857C0 != 0) {
            D_800857CA = 0;
            func_800AA370();
        }
        func_800AD49C();
        func_800AAC40();
        for (i = 0; i < D_8008AF78; i++) {
            if (D_8008A3E8[i] != NULL) {
                D_8008A3E8[i]->flags &= ~1;
            }
        }
        D_8008B210 = -1;
        D_80087AF2 = 1;
        if (func_800E0E24() == 1) {
            func_800E0CFC();
        }
        func_8003C7E4(1, 5);
        saved = func_8001AEA8(0);
        func_800B13A4();
        D_800892B0 = 1;
        *D_8007207C.caption = D_800015F8;
        D_8007207C.font = &D_8006C928;
        D_8007207C.width = 0x40;
        func_800DC978(D_80088090, &D_8007207C, 0x3C);
        func_800DCBC4();
        func_80041658();
        func_800B1744();
        func_800BDF68();
        func_8003190C(0x1000);
        func_8001AEA8(saved);
        func_8003C7E4(1, 4);
        func_800AAC94();
        D_80087AF2 = 0;
        for (i = 0; i < D_8008AF78; i++) {
            if (D_8008A3E8[i] != NULL) {
                D_8008A3E8[i]->flags |= 1;
            }
        }
        D_800892A0 = 1;
        D_80080C10 &= ~0x10000;
        func_8000BF08();
        func_8000BF08();
        func_8000BF08();
    }
}
