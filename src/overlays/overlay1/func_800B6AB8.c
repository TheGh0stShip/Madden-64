#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Window;

typedef struct {
    u8 pad00[6];
    u16 mirrored;
    u16 length;
    u8 pad0A[0xA];
    u16 slots[2][11];
} Track;

typedef struct {
    u8 pad000[0x206];
    u16 options;
} Team;

typedef struct {
    u8 pad00[6];
    s16 angle;
    u8 pad08[4];
    s32 state;
    u8 pad10[4];
    Team *team;
} Camera;

typedef struct {
    s16 x;
    s16 y;
} Spot;

extern s16 D_80064A72;
extern s16 D_800718E2;
extern Track *D_800718E8;
extern s16 D_800718EC;
extern s32 D_800718F4;
extern Spot D_800718FC[];
extern s32 D_80085D48;
extern s32 D_80086178;
extern Window *D_80086C88;
extern s32 D_8008741C;
extern s32 D_800874CC;
extern s32 D_8008757C;
extern s32 D_8008762C;
extern s32 D_8008775C;
extern Window *D_8008794C;
extern s32 D_80087A64;
extern u16 D_80087AC4;
extern s16 D_80087B5C;
extern Team *D_80088090;
extern s32 D_8008A058;
extern Window *volatile D_8008A3E8;
extern Camera D_8008A5E0;
extern s16 D_8008AF80;
extern s16 D_8008B212;
extern s32 D_8008B340;
extern s32 D_8008B620[];
extern s32 D_800A3164;

void func_8000BE80(void);
void func_8000BEE8(s32);
void func_8000BF08(void);
void func_8000CB78(Team *, s32 *, Camera *);
s32 func_8000D740(s32, s32, s32);
void func_8000D998(s32, s32);
void func_8000DC18(s32);
void func_80011308(void);
void func_80017ED0(s32, s32);
void func_80030050(void);
void func_80030110(void);
void func_80030884(void);
s32 func_80030B54(s16);
void func_80033B20(Window *, s32);
void func_80034388(Window *, s32);
void func_8003B9C0(u16, u16, u16);
void func_80041E4C(void);
void func_8004519C(void);
void func_800451C8(void);
void func_80098164(s32, s32);
void func_800A2F10(Camera *, s16, s16, s16);
u8 func_800A6580(void);
s32 func_800B22FC(s32, s32, s32);
void func_800B43C0(void);
void func_800B49CC(void);
void func_800B5028(u16);
void func_800B6378(s32);
void func_800B63B8(void);
void func_800B6610(void);
void func_800B67D4(s32);
u16 func_800B685C(s32 *, u16, s32, s32, s32);
void func_800BCFBC(void);
void func_800BF1C8(void);
void func_800BF644(s32);

void func_800B6AB8(void) {
    s32 windows[4];
    u16 done;
    u16 cursor;
    s32 prev;
    s32 j;
    s32 buttons;
    s32 pressed;
    s32 released;
    u16 length;

    D_800718E2 = 1;
    done = 0;
    func_80041E4C();
    cursor = 0;
    func_800B43C0();
    D_8008A058 = 0;
    windows[0] = func_800B22FC(0, 0, 0x21);
    windows[1] = func_800B22FC(0x37, 6, 0x22);
    windows[2] = func_800B22FC(9, 7, 0x23);
    windows[3] = func_800B22FC(9, 7, 0x24);
    func_80017ED0(windows[0], 0x50);
    func_80017ED0(windows[1], 0xA0);
    func_80017ED0(windows[2], 0xA0);
    func_80017ED0(windows[3], 0xA0);
    length = D_800718E8->length;
    D_8008AF80 = 1;
    D_8008B340 = 0;
    D_8008A5E0.state = 0;
    D_8008A5E0.team = D_80088090;
    D_80087AC4 = length;
    func_800B5028(length);
    func_800B6378(D_80086178);
    func_800BF1C8();
    D_8008A5E0.angle = 0;
    if (D_800718E8->mirrored != 0) {
        D_8008A5E0.angle = 0x800;
    }
    D_8008B212 = 2;
    if (D_80086C88 != NULL) {
        D_80086C88->flags |= 1;
    }
    if (func_800A6580() == 7) {
        func_800451C8();
    }
    func_800A2F10(&D_8008A5E0, D_800718FC[D_8008B340].x, D_800718FC[D_8008B340].y, D_8008A5E0.angle);
    prev = 0;
    if (D_8008A3E8 != NULL) {
        D_8008A3E8->flags &= ~1;
    }
    D_8008794C->flags &= ~1;
    func_80034388(D_8008794C, 0x10A);
    func_80033B20(D_8008794C, 1);
    func_800B6610();
    func_8000DC18(D_800874CC);
    func_8000DC18(D_8008741C);
    func_8000DC18(D_8008757C);
    func_8000DC18(D_8008762C);
    D_800718EC = 0;
    for (; prev < 2; prev++) {
        for (j = 0; j < 11; j++) {
            func_8003B9C0(prev, j, D_800718E8->slots[prev][j]);
        }
    }
    D_800718F4 = func_8000D740(D_8008775C, 5, 0);
    func_80098164(D_80085D48, D_800718F4);
    func_800B67D4(D_80088090->options & 0x100);
    func_8000CB78(D_80088090, &D_800A3164, &D_8008A5E0);
    func_8000BEE8(2);
    while (!done) {
        func_80030884();
        buttons = func_80030B54(D_80087B5C);
        released = (buttons ^ prev) & prev;
        pressed = ~prev & buttons;
        prev = buttons;
        if (pressed & 0x1000) {
            done = 1;
            func_80011308();
        }
        if (!done) {
            func_800BF644(D_8008B620[0]);
            func_800BF644(D_8008B620[1]);
            cursor = func_800B685C(windows, cursor, buttons, pressed, released);
        }
        func_800BCFBC();
        func_800B63B8();
        func_8000BF08();
        func_80030110();
        func_80030050();
    }
    func_8000BF08();
    func_8000BF08();
    if (D_8008A3E8 != NULL) {
        D_8008A3E8->flags |= 1;
    }
    func_8000BE80();
    func_8000D998(D_80087A64, windows[0]);
    func_8000D998(D_80087A64, windows[1]);
    func_8000D998(D_80087A64, windows[2]);
    func_8000D998(D_80087A64, windows[3]);
    func_8000BEE8(1);
    if (func_800A6580() == 7) {
        func_8004519C();
    }
    func_8000D998(D_8008775C, D_800718F4);
    func_800B49CC();
    func_800BCFBC();
    func_800BF1C8();
    D_8008AF80 = 0;
    D_80064A72 = 1;
    D_800718E2 = 0;
}
