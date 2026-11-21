#include "types.h"

typedef struct {
    s32 v[2][3];
} TeamCodes;

typedef struct {
    u8 pad00[0x60];
    u8 team;
    u8 conference;
} TeamInfo;

typedef struct {
    u8 pad00[0xC];
    s32 unk0C;
} ViewState;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Widget;

typedef struct {
    u8 pad00[0x24];
    ViewState *unk24;
    u8 pad28[0x38 - 0x28];
    Widget *unk38;
} Screen;

typedef struct {
    u8 pad00[0x44];
    s32 unk44;
} Scene;

typedef struct {
    u8 bytes[8];
} LogoEntry;

extern TeamCodes D_8008C244;
extern u16 D_800C5016;
extern s32 D_800C3A90[][3][22];
extern LogoEntry D_800C07C4[];
extern u8 D_800C509E[];
extern s32 D_800C48B8[];
extern u8 D_800E5EB8[];

Scene *func_800DD634(void);
void func_800DB44C(s32, s32 *, s32 *, s32 *);
s32 func_80030DF0(void);
void func_800DF6EC(void);
TeamInfo *func_8003A7B8(u16);
void func_80032F3C(s32, s32);
s32 func_800D3FF4(s32, s32, LogoEntry *, s32, s32);
void func_80017B80(s32);
void func_80017C24(s32);
void func_80016FE4(s32);
void func_800DB478(s32);
void func_800AACA8(Widget *, s32, Screen *);
void func_800D63B4(Screen *);
void func_800DF72C(void);
void func_800DE84C(void *);
void func_800DD4B8(void);

void func_800B6770(void *arg0, s32 arg1, u16 action) {
    TeamCodes codes = D_8008C244;
    Screen *screen;
    s32 x;
    s32 y;
    s32 z;
    s32 buttons;
    Scene *scene;
    s32 view;
    TeamInfo *info;
    s32 team;
    s32 conference;
    u32 i;
    s32 old;

    scene = func_800DD634();
    screen = arg0;
    view = screen->unk24->unk0C;
    func_800DB44C(view, &x, &y, &z);
    buttons = func_80030DF0();
    if (buttons & 0x200) {
        func_800DF6EC();
        info = func_8003A7B8(D_800C5016);
        team = info->team;
        conference = info->conference;
        if ((s16)D_800C5016 > 0) {
            D_800C5016 = (s16)D_800C5016 - 1;
        } else {
            D_800C5016 = 29;
        }
        info = func_8003A7B8(D_800C5016);
        if (info->team != team || info->conference != conference) {
            for (i = 0; i < 22; i++) {
                func_80032F3C(0, D_800C3A90[team][conference][i]);
            }
            for (i = 0; i < 22; i++) {
                D_800C3A90[info->team][info->conference][i] = func_800D3FF4(codes.v[info->team][info->conference] | 0x02000001, 30, &D_800C07C4[i], 0, 0);
            }
        }
        old = scene->unk44;
        scene->unk44 = D_800C48B8[D_800C509E[(s16)D_800C5016]];
        func_80017B80(scene->unk44);
        func_80017C24(old);
        func_80016FE4(scene->unk44);
        func_800DB478(view);
    }
    if (buttons & 0x100) {
        func_800DF6EC();
        info = func_8003A7B8(D_800C5016);
        team = info->team;
        conference = info->conference;
        if ((s16)D_800C5016 < 29) {
            D_800C5016 = (s16)D_800C5016 + 1;
        } else {
            D_800C5016 = 0;
        }
        info = func_8003A7B8(D_800C5016);
        if (info->team != team || info->conference != conference) {
            for (i = 0; i < 22; i++) {
                func_80032F3C(0, D_800C3A90[team][conference][i]);
            }
            for (i = 0; i < 22; i++) {
                D_800C3A90[info->team][info->conference][i] = func_800D3FF4(codes.v[info->team][info->conference] | 0x02000001, 30, &D_800C07C4[i], 0, 0);
            }
        }
        old = scene->unk44;
        scene->unk44 = D_800C48B8[D_800C509E[(s16)D_800C5016]];
        func_80017B80(scene->unk44);
        func_80017C24(old);
        func_80016FE4(scene->unk44);
        func_800DB478(view);
    }
    switch ((s16)action) {
        case 13:
            func_800AACA8(screen->unk38, 0, screen);
            screen->unk38->flags &= ~1;
            break;
        case 12:
            func_800D63B4(screen);
            break;
        case 8:
        case 28:
            func_800DF72C();
            func_800DE84C(D_800E5EB8);
            func_800DD4B8();
            break;
    }
}
