#include "types.h"

typedef struct {
    s16 state;
    s16 cursor;
    s16 scroll;
    u8 pad06[2];
    s16 timer;
    u8 pad0A[2];
    s32 owner;
    s32 target;
    s32 screen;
    u8 pad18[0x3C - 0x18];
    s32 handle;
} TextPanel;

extern s32 D_80088090;
extern s32 D_8008B3D0;
extern s16 D_80087A68;
extern TextPanel D_80086CE8;
extern s32 D_80086CFC;
extern s32 D_80086178;
extern u8 D_800A3164[];
extern u16 D_800886FC;
extern s32 D_80087A64;
extern s32 D_80085298;
extern volatile u16 D_8008A5B4;
extern void func_800448C4(void);
extern void func_8000C8AC(s32 arg0);
extern void func_8000C930(s32 *fade, s32 r, s32 g, s32 b);
extern void func_8000BEE8(s32 arg0);
extern void func_8000CB78(s32 screen, u8 *script, TextPanel *panel);
extern void func_800A2CD0(TextPanel *panel);
extern s32 func_80035EF0(u16 arg0, s32 arg1);
extern void func_800A64A0(TextPanel *panel, s32 text);
extern void func_800A2F10(TextPanel *panel, s32 arg1, s32 arg2, s32 arg3);
extern void func_80030910(void);
extern s32 func_80030DF0(void);
extern void func_8000DC7C(s32 arg0);
extern void func_8003456C(s32 arg0, u16 delta);
extern void func_8000BF08(void);
extern void func_80030110(void);
extern void func_80030050(void);
extern void func_800A2DB8(TextPanel *panel);
extern void func_800A2FF0(TextPanel *panel);
extern void func_8000CB90(s32 arg0);
extern void func_80035F88(u16 arg0, s32 arg1);
extern void func_8000C8BC(s32 arg0);

s32 func_800E75D4(s32 arg0, s32 textId) {
    TextPanel *panel;
    s32 *screen;
    s32 buttons;
    s32 elapsed;

    func_800448C4();
    func_8000C8AC(D_80088090);
    func_8000C930(&D_8008B3D0, 0, 0, 0);
    func_8000BEE8(2);
    switch (D_80087A68) {
    case 1:
        func_8000C930(&D_8008B3D0, 0x20, 0x20, 0x20);
        break;
    case 3:
        func_8000C930(&D_8008B3D0, 0xFF, 0xFF, 0xFF);
        break;
    case 4:
        func_8000C930(&D_8008B3D0, 8, 8, 8);
        break;
    default:
    case 2:
        func_8000C930(&D_8008B3D0, 0x68, 0x80, 0xD8);
        break;
    }
    buttons = 0;
    screen = &D_80086CFC;
    panel = (TextPanel *)((u8 *)screen - 0x14);
    D_80086CE8.cursor = 0;
    D_80086CE8.scroll = 0;
    panel->state = 0;
    D_80086CE8.timer = 0;
    *screen = D_80088090;
    D_80086CE8.owner = D_80086178;
    D_80086CE8.target = D_80086178;
    func_8000CB78(D_80088090, D_800A3164, panel);
    func_800A2CD0(panel);
    func_800A64A0(panel, func_80035EF0(D_800886FC, textId));
    func_800A2F10(panel, 0, 4, 0);
    elapsed = 0;
    if (D_80086CE8.handle != -1) {
        do {
            func_80030910();
            buttons = func_80030DF0();
            func_8000DC7C(D_80087A64);
            func_8003456C(D_80085298, D_8008A5B4);
            func_8000BF08();
            func_80030110();
            func_80030050();
            elapsed = D_8008A5B4 + elapsed;
        } while (elapsed < 0xF0 && D_80086CE8.handle != -1 && !(buttons & 0x1000));
    }
    func_800A2DB8(&D_80086CE8);
    func_800A2FF0(&D_80086CE8);
    func_8000CB90(D_80088090);
    func_8000BEE8(0);
    func_80035F88(D_800886FC, textId);
    func_8000C8BC(D_80088090);
    return (buttons & 0x1000) ? -1 : 1;
}
