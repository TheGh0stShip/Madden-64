#include "types.h"

typedef struct {
    s16 type;
    void *unk04;
    s32 unk08;
    s32 unk0C;
    s16 mode;
} LoadRequest;

typedef struct {
    void *unk0;
    s16 unk4;
    s8 unk6;
    s8 unk7;
} Msg;

typedef struct {
    u8 pad00[0x1C];
    s32 unk1C;
} Model;

typedef struct {
    u8 pad00[0x14];
    s32 unk14[4];
    u8 pad24[0x20];
    s32 unk44;
} Obj;

typedef struct {
    char name[0x32];
    char city[0x28];
    char abbr[0x2A];
    u8 *codes;
    u8 count;
    u8 ids[0x2B];
    Model *model;
} Teams;

typedef struct {
    u8 pad00[0x2C];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[0x28];
    s32 scroll;
    s32 dir;
    Teams *teams;
    u8 pad6C[8];
    s32 list[182];
} Screen;

extern s16 D_800C3A68;
extern s16 D_800C3A14;
extern char D_8006BFA0[];
extern s32 D_800892D8[4];
extern s32 D_80087AA8;
extern u8 D_800BF264[];

void *func_80032E00(s32, s32);
s16 func_800A4994(Teams *);
void func_8002E65C(char *, char *);
Obj *func_800DD634(void);
void func_800DD694(s32, s32, s32);
Model *func_8000D740(s32, s32, LoadRequest *);
void func_800DD82C(Msg *);
void func_800D6060(s32, u8 *, Screen *);
void func_800A5050(u8 *);
void func_800A4BC4(u16, Screen *);

void func_800A4198(Screen *screen) {
    Teams *teams;
    Obj *obj;
    Model *model;
    LoadRequest request;
    Msg msg;
    s16 sel;
    u32 i;
    s32 *list;

    D_800C3A68 = 0;
    D_800C3A14 = 0;
    teams = func_80032E00(0, 0xB8);
    screen->teams = teams;
    sel = func_800A4994(teams);
    if (sel == -1) {
        sel = 0x1A;
    }
    list = screen->list;
    list[0] = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list[i + 1] = 0;
    }
    list[i + 1] = 0;
    func_8002E65C(teams->name, D_8006BFA0);
    list[1] = (s32)teams->name;
    func_8002E65C(teams->city, D_8006BFA0);
    list[2] = (s32)teams->city;
    func_8002E65C(teams->abbr, D_8006BFA0);
    list[0x11] = (s32)teams->abbr;
    screen->unk2C = 0;
    screen->unk30 = 0x14A;
    screen->unk34 = 0xA0;
    screen->scroll = 0;
    screen->dir = 0;
    obj = func_800DD634();
    func_800DD694(0x48, 0x11, 5);
    obj->unk14[0] = D_800892D8[0];
    obj->unk14[1] = D_800892D8[1];
    obj->unk14[2] = D_800892D8[2];
    obj->unk14[3] = D_800892D8[3];
    obj->unk44 = 0;
    request.type = 0x90;
    request.unk04 = screen->list;
    request.unk08 = 0;
    request.mode = 7;
    model = func_8000D740(D_80087AA8, 1, &request);
    teams->model = model;
    model->unk1C = 0x14A;
    msg.unk6 = 1;
    msg.unk4 = 0;
    msg.unk7 = 10;
    msg.unk0 = model;
    func_800DD82C(&msg);
    D_800BF264[0x11] = sel;
    D_800BF264[1] = teams->count;
    func_800D6060(0x98, D_800BF264, screen);
    teams->codes = func_80032E00(0, 0x29);
    func_800A5050(teams->codes);
    func_800A4BC4(sel, screen);
}
