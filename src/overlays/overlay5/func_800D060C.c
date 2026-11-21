#include "types.h"

typedef struct {
    s16 type;
    s32 unk04;
    s32 unk08;
    s32 unk0C;
    s16 mode;
} LoadRequest;

typedef struct { s32 kind; s16 a; s16 b; s16 c; s16 pad; s32 d; s32 e; s32 pad2[4]; } Spec;

typedef struct {
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    s16 unk_06;
    s32 unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
    u8 pad18[0xA8];
} View;

typedef struct {
    u8 pad00[0x1C];
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;
} Panel;

typedef struct {
    View *view;
    Panel *unk_04;
    Panel *unk_08;
    Panel *unk_0C;
    s32 unk_10;
    s32 unk_14;
    s32 unk_18;
    char text[13][11];
    char line1[60];
    char line2[60];
    u8 count;
    s8 unk_124;
    u8 team;
    u8 unk_126;
    u8 kind;
    s8 value;
} Summary;

typedef struct {
    s32 unk_00;
    u8 pad04[0x2148];
} Side;

extern char D_8006BFA0[];
extern char D_8006D420[];
extern char D_8006DA28[];
extern char D_8006DEF0[];
extern Side D_80082DC8[];
extern s8 D_80085E50[];
extern s32 D_80086178;
extern View D_80086CE8;
extern s32 D_80086E30[];
extern s32 D_80086E44;
extern s32 D_80086E48;
extern s32 D_80086E64;
extern s32 D_80086E74;
extern s32 D_80087780[];
extern s32 D_80087A64;
extern s32 D_80088090;
extern u16 D_80088AEE;
extern u16 D_80088AF0;
extern u8 D_80088AF3;
extern s32 D_8008B36C;
extern u8 D_800A3164[];
extern u8 func_80000404[];

s32 func_8000C8A0(s32);
void func_8000CB78(s32, u8 *, View *);
Panel *func_8000D740(s32, s32, LoadRequest *);
s32 func_8000D874(s32, s32);
s32 func_8000D8DC(s32, Spec *);
void func_800167FC(s16, char *);
void func_80016FC4(u16);
s32 func_80016FD4(void);
void func_80016FE4(s32);
s32 func_8001AEA8(s32 *);
s32 func_80029934(void);
s32 func_80029944(void);
void func_80029954(u8, u8 *);
void func_8002E65C(char *, char *);
void *func_80032E00(s32, s32);
u16 func_800356C4(void *, s32);
void func_80035A7C(u16);
void func_800A2CD0(View *);
void func_800A2DB8(View *);
void func_800A365C(s32);
void func_800B43C0(void);
void func_800D0CEC(Summary *);
void func_800D1AB4(s32, s32);
void overlay5_time_text_format(s16, char *);
char *strcpy(char *, const char *);

Summary *func_800D060C(void) {
    LoadRequest req;
    Spec spec;
    s32 sumA = 0;
    s32 countA = 0;
    s32 sumB = 0;
    s32 countB = 0;
    s32 sumC = 0;
    s32 countC = 0;
    char blank[4] = "---";
    Summary *obj;
    View *view;
    u32 i;
    s32 type;
    s32 prev;
    u16 id;

    obj = func_80032E00(0, 0x294);
    obj->count = func_80029944();
    obj->team = D_80088AF3;
    type = -1;
    obj->unk_124 = func_80029934();
    func_800B43C0();
    for (i = 0; i < 8; i++) {
        D_80085E50[i] = -1;
    }
    func_800D1AB4(-2, 0);
    func_8000D874(D_80087A64, D_8008B36C);
    view = func_80032E00(0, 0xC0);
    *view = D_80086CE8;
    obj->view = view;
    view->unk_02 = 0xF;
    view->unk_04 = 0xF;
    view->unk_00 = 0;
    view->unk_14 = D_80088090;
    view->unk_0C = D_80086178;
    view->unk_10 = D_80086178;
    func_8000CB78(D_80088090, D_800A3164, view);
    func_800A2DB8(&D_80086CE8);
    func_800A2CD0(view);
    func_800A365C(1);
    D_80087780[0] = 0x10;
    for (i = 0; i < 16; i++) {
        if (i < 13) {
            func_8002E65C(obj->text[i], blank);
            D_80087780[i + 1] = (s32)obj->text[i];
        } else {
            D_80087780[i + 1] = 0;
        }
    }
    func_8002E65C(obj->line1, D_8006BFA0);
    func_8002E65C(obj->line2, D_8006BFA0);
    D_80087780[14] = (s32)obj->line1;
    D_80087780[15] = (s32)obj->line2;
    D_80086E30[0] = 0x11;
    for (i = 0; i < 17; i++) {
        D_80086E30[i + 1] = 0;
    }
    func_800167FC(obj->count, obj->text[1]);
    overlay5_time_text_format(D_80088AF0 - D_80088AEE, obj->text[2]);
    for (i = 0; i < obj->count; i++) {
        func_80029954(i, &obj->kind);
        switch (obj->kind & 0xF) {
        case 1:
            countA++;
            sumA += obj->value;
            break;
        case 2:
            countB++;
            sumB += obj->value;
            break;
        case 9:
            countC++;
            sumC += obj->value;
            break;
        case 7:
            type = 0;
            break;
        case 8:
            type = 1;
            break;
        case 4:
        case 6:
            type = 2;
            break;
        case 5:
        case 10:
        case 11:
            type = 3;
            break;
        }
    }
    func_800167FC(countA, obj->text[3]);
    func_800167FC(sumA, obj->text[6]);
    func_800167FC(countB, obj->text[4]);
    func_800167FC(sumB, obj->text[7]);
    func_800167FC(countC, obj->text[5]);
    func_800167FC(sumC, obj->text[8]);
    func_800167FC(sumA + sumB + sumC, obj->text[0]);
    func_8002E65C(obj->text[9], D_8006BFA0);
    switch (type) {
    case 0:
        func_8002E65C(obj->text[10], D_8006D420);
        break;
    case 1:
        func_8002E65C(obj->text[10], D_8006DEF0);
        break;
    case 2:
        strcpy(obj->text[9], "OTHER");
        func_8002E65C(obj->text[10], D_8006BFA0);
        break;
    case 3:
        func_8002E65C(obj->text[9], D_8006DA28);
        func_8002E65C(obj->text[10], D_8006BFA0);
        break;
    default:
        func_8002E65C(obj->text[10], D_8006BFA0);
        break;
    }
    func_8002E65C(obj->text[11], D_8006BFA0);
    func_8002E65C(obj->text[12], D_8006BFA0);
    req.type = 0x10;
    req.unk04 = (s32)D_80087780;
    req.unk08 = (s32)D_80086E30;
    req.mode = 7;
    obj->unk_04 = func_8000D740(func_8000C8A0(D_80088090), 1, &req);
    obj->unk_04->unk_1C = 0x14A;
    obj->unk_04->unk_20 = 2;
    obj->unk_04->unk_24 = 0;
    req.type = 0x18;
    req.unk04 = (s32)D_80087780;
    req.unk08 = (s32)D_80086E30;
    req.mode = 7;
    obj->unk_08 = func_8000D740(func_8000C8A0(D_80088090), 1, &req);
    obj->unk_08->unk_1C = -0x28;
    obj->unk_08->unk_20 = obj->unk_08->unk_24 = 0;
    req.type = 0;
    req.mode = 2;
    req.unk04 = 0;
    req.unk08 = 0;
    obj->unk_0C = func_8000D740(func_8000C8A0(D_80088090), 1, &req);
    obj->unk_0C->unk_1C = obj->unk_0C->unk_20 = 0;
    obj->unk_18 = func_8001AEA8(D_80086E30);
    D_80086E74 = D_80082DC8[obj->team].unk_00;
    prev = func_80016FD4();
    id = func_800356C4(func_80000404, 0x720);
    func_80016FC4(id);
    spec.kind = 0x1B;
    spec.pad2[1] = 0;
    spec.d = 0;
    spec.a = 5;
    spec.b = 0;
    spec.c = 0;
    spec.e = 0;
    D_80086E44 = obj->unk_10 = func_8000D8DC(0, &spec);
    func_80016FE4(D_80086E44);
    spec.kind = 0x1C;
    D_80086E48 = obj->unk_14 = func_8000D8DC(0, &spec);
    func_80016FE4(D_80086E48);
    spec.kind = 0x19;
    spec.a = 0;
    D_80086E64 = func_8000D8DC(0, &spec);
    func_80016FE4(D_80086E64);
    func_80035A7C(id);
    func_80016FC4(prev);
    obj->unk_126 = 0;
    func_800D0CEC(obj);
    return obj;
}
