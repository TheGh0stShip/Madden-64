#include "types.h"

typedef struct Window {
    u8 pad00[0xC];
    void *unk_0C;
    void *unk_10;
    s32 unk_14;
    u8 pad18[4];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
    u8 pad28[4];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[4];
    s16 unk_3C;
    s16 unk_3E;
    s32 unk_40;
    s32 unk_44;
    struct WindowSub *unk_48;
} Window;

typedef struct WindowSub {
    u8 pad00[0x16];
    s16 unk_16;
} WindowSub;

typedef struct Msg {
    u8 type;
    u8 pad01[7];
} Msg;

typedef struct Slot {
    u8 pad00[0xA];
    u8 unk_0A;
    u8 pad0B;
    s16 unk_0C;
    u8 pad0E[0x11];
    u8 unk_1F;
    u8 pad20;
    u8 unk_21;
    u8 pad22[2];
    Window *window;
    u8 pad28[8];
    s16 unk_30;
    u8 pad32[0x7E];
} Slot;

extern void *D_80069A68;
extern void *D_80069A88;
extern void *D_80069AB8;
extern void *D_80069B78;
extern u8 D_80074824[];
extern s32 D_8007A078;
extern s32 D_8007A07C;
extern u32 D_8007A084;
extern u16 D_80085130;
extern u32 D_800854A4;
extern u8 *D_80085BEC;
extern s16 D_800869D4;
extern Slot D_80087138[];
extern s32 D_80087950;
extern s16 D_80087AC0;
extern s32 D_80087FA4;
extern s32 D_80087FAC;
extern void *D_80088630;
extern s8 D_80088636;
extern Window *D_800886E4;
extern u16 D_8008931A;
extern s8 D_8008AF70;
extern u16 D_8008B214;
extern void D_8009B790(void);

extern Window *func_8000D740(void *, s32, void *);
extern u16 func_80016FD4(void);
extern s32 func_80031A1C(s32);
extern void *func_80035D7C(u16, void *);
extern void *func_8009518C(s32);
extern u16 func_80096878(s32, u8 *);
extern void func_80096A00(Window *, u16);
extern void func_8009B980(void);
extern void func_8009BB00(void);
extern void func_800A2BAC(s32);
extern s32 func_800E1A84(Slot *, Msg *);
extern s32 func_800E1C98(Slot *);
extern void func_800B95D8(Window *);
extern void func_800B96C0(Window *, u8 *);
extern void func_800C0C8C(Slot *, s32);
extern void func_8009B280(Window *, u16, s32, u16);

void func_8009F9E8(void *arg0) {
    Msg msg;
    s16 i;
    s32 zero;
    s32 second;
    s32 third;

    zero = 0;
    D_8007A078 = 0;
    D_8007A07C = 0;
    func_800A2BAC(0);
    D_8007A084 = 0;
    D_800854A4 = 0;
    D_80087FA4 = 8;
    D_80087FAC = 0;
    D_8008AF70 = 0;
    D_80085BEC = func_80035D7C(func_80016FD4(), (void *)0x20);
    D_8008931A = func_80096878(0x10, D_80085BEC);
    D_8008B214 = func_80096878(0x10, D_80085BEC + 0x20);
    D_80085130 = func_80096878(0x10, D_80085BEC + 0x40);
    second = 0;
    D_80069B78 = D_80069AB8 = func_8009518C(1);
    D_80069A68 = D_80088630;
    D_80069A88 = func_8009518C(2);
    third = func_80031A1C(0x1E);
    D_80087950 = 0;
    for (i = 0; i < 8; i++) {
        D_80087138[i].unk_1F = i;
        D_80087138[i].unk_21 = 0;
        D_80087138[i].unk_30 = 0;
        if (i >= 4) {
            D_80087138[i].window = func_8000D740(arg0, 6, &D_80069A88);
        } else {
            D_80087138[i].window = func_8000D740(arg0, 7, &D_80069A68);
            func_8009B280(D_80087138[i].window, zero, second, third);
            { s32 step = func_80031A1C(0x14) + 1; third += step; }
            second = 1;
        }
        D_80087138[i].window->unk_1C = 0;
        D_80087138[i].window->unk_20 = 0;
        D_80087138[i].window->unk_24 = 0;
        D_80087138[i].window->unk_2C = 0;
        D_80087138[i].window->unk_30 = 0;
        D_80087138[i].window->unk_34 = 0;
        D_80087138[i].window->unk_3E = 0;
        D_80087138[i].window->unk_3C = 0x96;
        D_80087138[i].window->unk_40 = 0x2000;
        D_80087138[i].window->unk_44 = 0x1800;
        D_80087138[i].window->unk_14 = 0x235;
        D_80087138[i].window->unk_0C = D_8009B790;
        D_80087138[i].window->unk_10 = &D_80087138[i];
        D_80087138[i].unk_0C = 0x20;
        D_80087138[i].unk_0A = 0xA0;
        func_800E1C98(&D_80087138[i]);
        if (i >= 4) {
            func_80096A00(D_80087138[i].window, D_80085130);
            D_80087138[i].window->unk_14 &= ~0x200;
            msg.type = 0x3A;
            func_800E1A84(&D_80087138[i], &msg);
            func_800C0C8C(&D_80087138[i], 0x200);
        } else {
            func_800B95D8(D_80087138[i].window);
            D_80087138[i].window->unk_48->unk_16 = 2;
            func_800B96C0(D_80087138[i].window, D_80074824);
            msg.type = 0x34;
            func_800E1A84(&D_80087138[i], &msg);
            func_800C0C8C(&D_80087138[i], 0x41);
        }
    }
    D_800886E4 = func_8000D740(arg0, 6, &D_80069B78);
    D_800886E4->unk_3C = 0x32;
    D_800886E4->unk_40 = 0x1000;
    D_800886E4->unk_1C = 0;
    D_800886E4->unk_20 = 0;
    D_800886E4->unk_24 = 0;
    D_800886E4->unk_2C = 0;
    D_800886E4->unk_30 = 0;
    D_800886E4->unk_34 = 0;
    D_800886E4->unk_3E = 0;
    D_800886E4->unk_44 = 0;
    D_800886E4->unk_14 = 0x30;
    D_800886E4->unk_0C = 0;
    D_800886E4->unk_10 = 0;
    func_80096A00(D_800886E4, D_80085130);
    func_8009BB00();
    func_8009B980();
    D_800869D4 = 0;
    D_80087AC0 = 0;
    D_80088636 = -1;
}
