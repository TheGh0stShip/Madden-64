#include "types.h"

typedef struct { char *s[9]; } Labels;
typedef struct { s32 w[4]; } Str16;

typedef struct {
    u16 type;
    void *unk04;
    s32 unk08;
    s32 unk0C;
    s16 mode;
} LoadRequest;

typedef struct {
    s32 unk00;
    s16 unk04;
    s16 unk06;
    s16 unk08;
    s32 unk0C;
    s32 unk10;
    u8 pad14[0x14];
} ObjConfig;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
} SceneNode;

typedef struct {
    s32 items[3];
    void *unkC;
    void *unk10;
    s32 unk14;
    s32 unk18;
} Request;

typedef struct {
    s32 x;
    s32 y;
    s32 w;
    s32 h;
} Pos;

typedef struct {
    u8 pad00[0x28];
} Field;

typedef struct {
    u8 active;
    u8 pad01;
    u16 col;
    u16 row;
    u8 pad06[4];
    u16 team;
    u16 unk0C;
    u16 unk0E;
    u8 pad10[0x2E];
    u8 name[13];
    u8 unk4B;
    u8 unk4C;
    u8 unk4D;
    u8 unk4E;
    u8 unk4F;
    u8 pad50[0x24];
    s32 unk74;
    Str16 title;
    u8 pad88[0x10];
} Editor;

typedef struct {
    u8 pad00[0x6C];
    u16 players[55];
    u8 name[1];
} Roster;

extern Labels D_80002DCC;
extern Str16 D_80002DF0;
extern char D_80002E00[];
extern Editor *D_800895EC;
extern u16 D_80084F40;
extern s32 D_80088090;
extern s32 D_8008931C;
extern s32 D_80071970;
extern void *D_80087780[];
typedef struct { s32 a; s32 b; } Pair;
extern Pair D_80086E30;
extern char D_800C3094[];
extern void *D_800893B8;
extern Roster D_80080C90;
extern void (*D_80073D44[])(u16, Field *);
extern Field D_800E76B8[];
extern u8 D_800C16E4[];
extern s16 D_800C5C36;
extern u8 D_800C29E8[];
extern u8 D_800C2A00[];
extern u8 D_800C2A18[];
extern u8 D_800C2A2C[];
extern u8 D_800C2A44[];
extern u8 D_800C2A5C[];
extern u8 D_800C2A74[];
extern u8 D_800C32A4[];
extern u8 D_800C32B8[];
extern u8 D_800C32C4[];
extern u8 D_800C32D0[];

u16 func_80016FD4(void);
void func_80016FC4(u16);
void func_80016FE4(s32);
void func_80016FF4(s32);
void *func_80032E00(s32, s32);
void func_80033308(s32, void *, s32, s32);
s32 func_8000C8A0(s32);
SceneNode *func_8000D740(s32, s32, void *);
void func_80094114(void);
u16 func_8003A50C(void);
void func_800167FC(u8, char *);
void func_8002E688(char *, char *);
void func_800BB1E8(u16);
char *func_8004DFBC(char *, s32);
s16 func_8004DF94(char *);
void func_800B9FF4(void);
void func_800BA5A0(void);
void func_8001AEA8(s32 *);
void func_8001F070(SceneNode *, s32, Pos *);
void *func_8001B02C(u16);
void func_800D3F4C(s32, s32 *, s32, s32);
void func_80092B98(void);
void func_8001ECAC(SceneNode *, s32, s32);
void func_8001EC20(SceneNode *, s32);
s32 func_80030C74(s32 *);
void func_800DF6EC(void);
void func_800DF72C(void);
void func_800BA3FC(void);
void func_800BA254(void);
void func_800BA114(SceneNode *);
u8 func_8003C60C(u8, u8, s32);
u8 func_8003C40C(u16 *, u8 *, u8, u8);
u8 func_8003C1F8(u16 *, u8 *, u8, u8);
u16 func_800BA61C(u16);
void func_800BB0BC(s8, void *);
void func_800B9BE0(u16, Field *);
void func_800D67EC(void *, s32);
void func_800BB384(void);
u8 func_800BB360(void);
u16 func_8003A48C(s32);
void func_800BC684(void);
void func_800D67B8(Request *);
s16 func_800D6454(Request *);
void func_800940D4(void);
void func_8000D874(s32, void *);
void func_8000D834(s32, void *);
void func_80032F3C(s32, void *);

/* Create-player editor screen: allocates the editor state on first entry, builds the
 * label list and title, then runs the input loop (rows: team, name, position, number,
 * height, weight, handed, skin, continue). Confirming hands off to func_800BC684. */
void func_800BB46C(void) {
    LoadRequest request;
    ObjConfig config;
    Request msg;
    Pos pos;
    Labels labels;
    char buf[16];
    s32 held;
    s16 i;
    u16 saved;
    s16 editing;
    u16 row;
    u16 col;
    s16 letter;
    s32 pad;
    SceneNode *scene;
    SceneNode *selector;
    SceneNode *caret;
    void *gauge;
    u8 n;
    u16 team;
    void (**handlers)(u16, Field *);

    held = 0;
    editing = 0;
    labels = D_80002DCC;
    saved = func_80016FD4();
    func_80016FC4(D_80084F40);
    if (D_800895EC == 0) {
        D_800895EC = func_80032E00(0, 0x98);
        func_80033308(0, D_800895EC, 0x98, 0);
        D_800895EC->team = 0xFF;
        D_800895EC->name[0] = 'A';
        D_800895EC->name[1] = 0;
        D_800895EC->unk4C = 0;
        D_800895EC->unk4E = 1;
        func_80016FC4(D_80084F40);
        config.unk04 = 2;
        config.unk06 = 0x13;
        config.unk08 = 0x10;
        config.unk0C = 0;
        config.unk00 = 2;
        D_800895EC->unk74 = (s32)func_8000D740(func_8000C8A0(D_80088090), 0, &config);
        func_80016FE4(D_800895EC->unk74);
        func_80094114();
        func_80016FE4(D_80071970);
    }
    D_80087780[0] = (void *)0x12;
    for (i = 0; i < 9; i++) {
        D_80087780[i + 9] = labels.s[i];
    }
    D_800895EC->title = D_80002DF0;
    n = func_8003A50C() + 1;
    if (n > 24) {
        n = 24;
    }
    func_800167FC(n, buf);
    func_8002E688((char *)&D_800895EC->title, buf);
    func_8002E688((char *)&D_800895EC->title, D_80002E00);
    func_800167FC(24, buf);
    func_8002E688((char *)&D_800895EC->title, buf);
    D_80087780[18] = (char *)&D_800895EC->title;
    row = D_800895EC->row;
    col = D_800895EC->col;
    func_800BB1E8(row);
    letter = func_8004DFBC(D_800C3094, D_800895EC->name[col]) - D_800C3094;
    D_80086E30.a = 0x1E;
    D_80086E30.b = 0;
    func_800B9FF4();
    D_800895EC->active = 1;
    func_800BA5A0();
    func_8001AEA8(&D_80086E30.a);
    request.type = 0x318;
    request.mode = 6;
    request.unk04 = D_80087780;
    request.unk08 = 0;
    scene = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
    scene->unk20 = 0xF0;
    request.type = 0x320;
    request.mode = 5;
    selector = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
    selector->flags &= ~1;
    request.type = 0x6B8;
    request.mode = 5;
    caret = func_8000D740(func_8000C8A0(D_80088090), 1, &request);
    pos.y = selector->unk20 + 0x22;
    func_8001F070(scene, 1, &pos);
    caret->unk20 = pos.y + 5;
    caret->unk1C = pos.x;
    caret->flags &= ~1;
    gauge = func_8001B02C(request.type);
    while (scene->unk20 != 0) {
        func_800D3F4C(10, &scene->unk20, 0, 1);
        func_80092B98();
    }
    pos.y = selector->unk20 + 0x22;
    func_8001F070(scene, row + 9, &pos);
    selector->unk20 = pos.y - 0x10;
    selector->flags |= 1;
    for (i = 0; i < 7; i++) {
        func_8001ECAC(scene, i + 1, 0);
    }
    func_8001ECAC(scene, 0x11, 5);
    func_8001ECAC(scene, row + 9, 6);
    if (row != 8) {
        func_8001ECAC(scene, row + 1, 6);
    }
    handlers = D_80073D44;
    if (func_8003A50C() < 24) {
        for (;;) {
            func_80092B98();
            pad = func_80030C74(&held);
            if (held & 0x300) {
                if (pad & 0x200) {
                    switch (row) {
                    case 0:
                        func_800DF6EC();
                        func_800BA3FC();
                        func_800BA114(scene);
                        break;
                    case 1:
                        if (editing) if (col != 0) {
                            func_800DF6EC();
                            col--;
                            letter = func_8004DFBC(D_800C3094, D_800895EC->name[col]) - D_800C3094;
                            func_8001F070(scene, 2, &pos);
                            caret->unk20 = pos.y + 5;
                            caret->unk1C = pos.x + func_800BA61C(col);
                            func_800BB0BC(D_800895EC->name[col], gauge);
                        }
                        break;
                    case 2:
                        func_800DF6EC();
                        if (D_800895EC->unk4B == 0) {
                            D_800895EC->unk4B = 23;
                        }
                        D_800895EC->unk4B--;
                        D_800895EC->unk0E = 0;
                        if (D_800895EC->team == 0xFF) {
                            D_800895EC->unk4C = func_8003C60C(D_800895EC->unk4B, 0, 1);
                        } else {
                            D_800895EC->unk4C = func_8003C1F8(D_80080C90.players, D_80080C90.name, D_800895EC->unk4B, 0);
                        }
                        D_80073D44[3](3, &D_800E76B8[3]);
                        func_8001EC20(scene, 4);
                        break;
                    case 3:
                        func_800DF6EC();
                        if (D_800895EC->team != 0xFF) {
                            D_800895EC->unk4C = func_8003C40C(D_80080C90.players, D_80080C90.name, D_800895EC->unk4B, D_800895EC->unk4C);
                        } else {
                            D_800895EC->unk4C = func_8003C60C(D_800895EC->unk4B, D_800895EC->unk4C, -1);
                        }
                        break;
                    case 4:
                        func_800DF6EC();
                        if (D_800895EC->unk0C != 0) {
                            D_800895EC->unk0C--;
                        } else {
                            D_800895EC->unk0C = 26;
                        }
                        break;
                    case 5:
                        func_800DF6EC();
                        D_800895EC->unk4D--;
                        break;
                    case 6:
                        func_800DF6EC();
                        D_800895EC->unk4E ^= 1;
                        break;
                    case 7:
                        func_800DF6EC();
                        D_800895EC->unk4F ^= 1;
                        break;
                    }
                } else if (pad & 0x100) {
                    switch (row) {
                    case 0:
                        func_800DF6EC();
                        func_800BA254();
                        func_800BA114(scene);
                        break;
                    case 1:
                        if (editing) if (col < 11) {
                            func_800DF6EC();
                            col++;
                            if (D_800895EC->name[col] == 0) {
                                D_800895EC->name[col] = ' ';
                                D_800895EC->name[col + 1] = 0;
                            }
                            letter = func_8004DFBC(D_800C3094, D_800895EC->name[col]) - D_800C3094;
                            func_8001F070(scene, 2, &pos);
                            caret->unk20 = pos.y + 5;
                            caret->unk1C = pos.x + func_800BA61C(col);
                            func_800BB0BC(D_800895EC->name[col], gauge);
                        }
                        break;
                    case 2:
                        func_800DF6EC();
                        D_800895EC->unk0E = 0;
                        D_800895EC->unk4B = (D_800895EC->unk4B + 1) % 23;
                        if (D_800895EC->team == 0xFF) {
                            D_800895EC->unk4C = func_8003C60C(D_800895EC->unk4B, 0, 1);
                        } else {
                            D_800895EC->unk4C = func_8003C1F8(D_80080C90.players, D_80080C90.name, D_800895EC->unk4B, 0);
                        }
                        D_80073D44[3](3, &D_800E76B8[3]);
                        func_8001EC20(scene, 4);
                        break;
                    case 3:
                        func_800DF6EC();
                        if (D_800895EC->team != 0xFF) {
                            D_800895EC->unk4C = func_8003C1F8(D_80080C90.players, D_80080C90.name, D_800895EC->unk4B, D_800895EC->unk4C);
                        } else {
                            D_800895EC->unk4C = func_8003C60C(D_800895EC->unk4B, D_800895EC->unk4C, 1);
                        }
                        break;
                    case 4:
                        func_800DF6EC();
                        if (D_800895EC->unk0C < 26) {
                            D_800895EC->unk0C++;
                        } else {
                            D_800895EC->unk0C = 0;
                        }
                        break;
                    case 5:
                        func_800DF6EC();
                        D_800895EC->unk4D++;
                        break;
                    case 6:
                        func_800DF6EC();
                        D_800895EC->unk4E ^= 1;
                        break;
                    case 7:
                        func_800DF6EC();
                        D_800895EC->unk4F ^= 1;
                        break;
                    }
                }
                if (row != 0 && row != 8) {
                    handlers[row](row, &D_800E76B8[row]);
                    func_8001EC20(scene, row + 1);
                }
            } else {
                if (pad & 0x800) {
                    if (editing) {
                        func_800DF6EC();
                        letter++;
                        if (letter >= func_8004DF94(D_800C3094)) {
                            letter = 0;
                        }
                        D_800895EC->name[col] = D_800C3094[letter];
                        func_800BB0BC(D_800895EC->name[col], gauge);
                        func_800B9BE0(row, &D_800E76B8[row + 1]);
                        func_8001EC20(scene, row + 1);
                    } else {
                        func_800DF6EC();
                        func_8001ECAC(scene, row + 9, 5);
                        if (row != 8) {
                            func_8001ECAC(scene, row + 1, 0);
                        }
                        if (row == 0) {
                            row = 8;
                        } else {
                            row--;
                        }
                        func_800BB1E8(row);
                        pos.y = selector->unk20 + 0x22;
                        func_8001F070(scene, row + 9, &pos);
                        selector->unk20 = pos.y - 0x10;
                        func_8001ECAC(scene, row + 9, 6);
                        if (row != 8) {
                            func_8001ECAC(scene, row + 1, 6);
                        }
                    }
                }
                if (pad & 0x400) {
                    if (editing) {
                        func_800DF6EC();
                        letter--;
                        if (letter < 0) {
                            letter = func_8004DF94(D_800C3094) - 1;
                        }
                        D_800895EC->name[col] = D_800C3094[letter];
                        func_800BB0BC(D_800895EC->name[col], gauge);
                        func_800B9BE0(row, &D_800E76B8[row + 1]);
                        func_8001EC20(scene, row + 1);
                    } else {
                        func_800DF6EC();
                        func_8001ECAC(scene, row + 9, 5);
                        if (row != 8) {
                            func_8001ECAC(scene, row + 1, 0);
                        }
                        if (row >= 8) {
                            row = 0;
                        } else {
                            row++;
                        }
                        func_800BB1E8(row);
                        pos.y = selector->unk20 + 0x22;
                        func_8001F070(scene, row + 9, &pos);
                        selector->unk20 = pos.y - 0x10;
                        func_8001ECAC(scene, row + 9, 6);
                        if (row != 8) {
                            func_8001ECAC(scene, row + 1, 6);
                        }
                    }
                }
            }
            if (pad & 2) {
                func_800D67EC(D_800C16E4, 0);
            }
            if (row == 1) {
                if (!editing) {
                    if (pad & 0x8000) {
                        func_800DF72C();
                        selector->flags &= ~1;
                        caret->flags |= 1;
                        func_8001F070(scene, 2, &pos);
                        caret->unk20 = pos.y + 5;
                        caret->unk1C = pos.x + func_800BA61C(col);
                        editing = 1;
                        continue;
                    }
                    if (pad & 0x4000) {
                        goto quit;
                    }
                    if (pad & 0x1000) {
                        goto confirm;
                    }
                    continue;
                }
                if (pad & 0x4000) {
                    func_800DF72C();
                    letter = 1;
                    D_800895EC->name[0] = 'A';
                    D_800895EC->name[1] = 0;
                    func_800BB0BC(D_800895EC->name[0], gauge);
                    col = 0;
                    caret->unk1C = func_800BA61C(0) + 0x97;
                    D_80073D44[1](1, &D_800E76B8[1]);
                    func_8001EC20(scene, 2);
                    selector->flags |= 1;
                    caret->flags &= ~1;
                    editing = 0;
                } else if (pad & 0x8000) {
                    func_800DF72C();
                    selector->flags |= 1;
                    caret->flags &= ~1;
                    func_800BB384();
                    editing = 0;
                    if (col >= (u16)func_8004DF94((char *)D_800895EC->name)) {
                        col = func_8004DF94((char *)D_800895EC->name) - 1;
                    }
                    letter = func_8004DFBC(D_800C3094, D_800895EC->name[col]) - D_800C3094;
                    D_80073D44[1](1, &D_800E76B8[1]);
                    func_8001EC20(scene, 2);
                }
                continue;
            }
            if ((pad & 0x1000) || (row == 8 && (pad & 0x8000))) {
            confirm:
                func_800DF72C();
                team = D_800895EC->team;
                if ((team == 0xFF && func_800BB360() != 0)
                    || ((team != 0xFF || D_800895EC->team != team) && func_8003A48C(0) < 54)) {
                    D_800893B8 = func_800BC684;
                    D_800895EC->col = col;
                    D_800895EC->row = row;
                    break;
                }
                func_800D67B8(&msg);
                msg.items[0] = (s32)D_800C2A44;
                msg.items[1] = (s32)D_800C2A5C;
                msg.items[2] = (s32)D_800C2A74;
                func_800D6454(&msg);
            }
            if (pad & 0x4000) {
            quit:
                func_800DF72C();
                func_800D67B8(&msg);
                msg.items[0] = (s32)D_800C32A4;
                msg.items[1] = (s32)D_800C32B8;
                msg.unkC = D_800C32C4;
                msg.unk10 = D_800C32D0;
                msg.unk18 = 1;
                if (func_800D6454(&msg) == 0) {
                    D_800893B8 = 0;
                    break;
                }
            }
        }
    } else {
        func_800D67B8(&msg);
        msg.items[0] = (s32)D_800C29E8;
        if (D_800C5C36 == 1) {
            msg.items[1] = (s32)D_800C2A00;
            msg.items[2] = (s32)D_800C2A2C;
        } else {
            msg.items[1] = (s32)D_800C2A18;
        }
        func_800D6454(&msg);
        D_800893B8 = 0;
    }
    if (D_800893B8 == 0) {
        func_80016FF4(D_800895EC->unk74);
        func_800940D4();
    }
    while (scene->unk20 < 0xF4) {
        func_800D3F4C(10, &scene->unk20, 0xF4, 0);
        func_800D3F4C(10, &selector->unk20, 0xF4, 0);
        func_800D3F4C(10, &caret->unk20, 0x148, 0);
        func_80092B98();
    }
    if (D_800893B8 == 0) {
        func_8000D874(func_8000C8A0(D_80088090), (void *)D_800895EC->unk74);
        func_8000D834(D_8008931C, (void *)D_800895EC->unk74);
        func_800940D4();
        func_80032F3C(0, D_800895EC);
        D_800895EC = 0;
    }
    func_8000D874(func_8000C8A0(D_80088090), caret);
    func_8000D834(D_8008931C, caret);
    func_8000D874(func_8000C8A0(D_80088090), scene);
    func_8000D834(D_8008931C, scene);
    func_8000D874(func_8000C8A0(D_80088090), selector);
    func_8000D834(D_8008931C, selector);
    func_80092B98();
    func_80092B98();
    func_80016FC4(saved);
}
