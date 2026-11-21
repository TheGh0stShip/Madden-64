#include "types.h"

typedef struct {
    u8 kind;
    s8 yards;
    u8 player;
} Play;

typedef struct {
    s32 unk_00;
    Play *plays[1];
} PlayList;

typedef struct {
    u8 unk_00;
    char name[0xD9];
    char roster[52][0x28];
    u8 unk_8FA[0x214C - 0x8FA];
} Team;

extern Team D_80080C90[];

typedef struct {
    char c[2];
} Lit2;

typedef struct {
    char c[3];
} Lit3;

typedef struct {
    char c[4];
} Lit4;

typedef struct {
    char c[5];
} Lit5;

typedef struct {
    char c[9];
} Lit9;

typedef struct {
    char c[11];
} Lit11;

extern Lit4 D_80001E6C;
extern Lit4 D_80001E70;
extern Lit9 D_80001E74;
extern Lit9 D_80001E80;
extern Lit11 D_80001E8C;
extern Lit3 D_80001E98;
extern Lit2 D_80001E9C;
extern Lit5 D_80001EA0;
extern char D_8006BFA0[];
extern char D_8006D864[];
extern char D_8006DEF0[];
extern char D_8006C194[];
extern char D_8006C1A0[];
extern char D_8006C1B4[];

void func_8002E65C(char *dst, char *src);
void func_8002E688(char *dst, char *src);
void func_8003E8F4(char *dst, s32 width, s32 arg2);
void func_800167FC(s16 value, char *dst);

void func_800CFD5C(s32 index, PlayList *list, char *out) {
    char yards[16];
    Lit4 run = D_80001E6C;
    Lit4 rec = D_80001E70;
    Lit9 kick_ret = D_80001E74;
    Lit9 punt_ret = D_80001E80;
    Lit11 fumble_rec = D_80001E8C;
    Lit3 fg = D_80001E98;
    Lit2 s = D_80001E9C;
    Lit5 yd = D_80001EA0;
    s32 team;
    s32 player;

    if (list->plays[index]->player & 0x80) {
        team = 1;
        player = list->plays[index]->player & 0x7F;
    } else {
        team = 0;
        player = list->plays[index]->player;
    }
    if (list->plays[index]->player != 0xFF) {
        func_8002E65C(out, D_80080C90[team].roster[player]);
    } else {
        func_8002E65C(out, D_80080C90[team].name);
    }
    func_8003E8F4(out, 0x3C, 0);
    func_8002E688(out, D_8006BFA0);
    func_800167FC(list->plays[index]->yards, yards);
    func_8002E688(out, yards);
    func_8002E688(out, yd.c);
    switch (list->plays[index]->kind) {
        case 1:
            func_8002E688(out, run.c);
            break;
        case 2:
            func_8002E688(out, rec.c);
            break;
        case 3:
            func_8002E688(out, kick_ret.c);
            break;
        case 4:
            func_8002E688(out, punt_ret.c);
            break;
        case 5:
            func_8002E688(out, fumble_rec.c);
            break;
        case 6:
            func_8002E688(out, D_8006D864);
            break;
        case 7:
            func_8002E688(out, fg.c);
            break;
        case 8:
            func_8002E65C(out, D_8006DEF0);
            break;
        case 10:
            func_8002E65C(out, D_8006C194);
            break;
        case 11:
            func_8002E65C(out, D_8006C1A0);
            break;
        case 12:
            func_8002E65C(out, D_8006C1B4);
            break;
        default:
            func_8002E688(out, s.c);
            break;
    }
}
