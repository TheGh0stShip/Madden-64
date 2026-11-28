#include "types.h"

typedef struct {
    s16 kind;
    s16 pad02;
    void *list;
    s32 x08;
    s32 pad0C;
    s16 x10;
    s16 pad12;
} Spec;

typedef struct {
    void *sprite;
    s16 x04;
    u8 x06;
    u8 x07;
} Anim;

typedef struct {
    u8 pad00[0x1C];
    s32 x1C;
} Sprite;

typedef struct {
    u8 pad00[4];
    s16 x04;
    s16 x06;
    s16 x08;
    u8 pad0A[6];
    s32 x10;
    u8 pad14[0x14];
    s32 x28;
    s32 x2C;
    s32 pad30;
    s32 x34;
    s32 x38;
    s32 x3C;
    u8 pad40[0x34];
    s32 x74;
} Game;

typedef struct {
    u8 pad00[0x14];
    s32 x14[8];
    u8 pad34[0x14];
    s32 x48;
} Menu;

typedef struct {
    u8 unk00;
    u8 count;
    u8 pad02[0x20];
    s16 x22;
} MenuSelectionState;

typedef struct {
    u8 name[13];
} Name;

typedef struct {
    s32 value;
    s32 unk4;
} Pair;

typedef struct {
    u8 pad00[0x2C];
    s32 x2C;
    s32 x30;
    s32 x34;
    u8 pad38[4];
    Sprite *x3C;
    u8 pad40[0x2C];
    s32 x6C;
    u8 pad70[4];
    union {
        s32 list[75];
        struct {
            s32 pad74[56];
            union {
                s32 x154[6];
                struct {
                    s32 pad154[5];
                    Name *x168;
                } named;
            } data;
            s32 x16C;
        } fields;
    } tail;
} Obj;

extern u8 D_800C4EDE;
extern void *D_800C0184;
extern u8 D_800C1D80[];
extern u8 D_800C1DD8[];
extern u16 *D_8007A2B0;
extern s8 D_8007A288;
extern u16 D_800C4B5C[][49];
extern MenuSelectionState D_800C01AC;
extern u8 D_8007A2B4;
extern s16 D_8006B9E0;
extern s16 D_8006B9E4[];
extern s32 D_800892D8[8];
extern s32 D_80088090;
extern Pair D_800BFFE8[];
extern Name D_800C4AD4[];
extern u8 D_800C4B44[];
extern s32 D_800C017C[];
extern u16 D_80084F40;
extern Game *D_80087938;
extern u8 D_80071A28[];
extern u16 D_800C391C[];
extern s32 D_800C48B8[];
extern s16 D_800892B4[];
extern s32 D_800BDFAC;
extern s32 D_800BDFB0;

void *func_80032E00(s32, s32);
void func_8003A600(s32, s32);
void func_80024694(void);
void func_800DD694(s32, s32, s32);
void func_800D54E4(s32);
Menu *func_800DD634(void);
void func_80016FF4(s32);
void func_800D6060(s32, MenuSelectionState *, Obj *);
s32 func_8000C8A0(s32);
Sprite *func_8000D740(s32, s32, Spec *);
void func_800DD82C(Anim *);
u16 func_80016FD4(void);
void func_80016FC4(u16);
void func_80033308(s32, Game *, s32, s32);
void func_80017B80(s32);
void func_800A3FD4(s32, Game *);

void func_8009B4F0(Obj *obj) {
    Spec spec;
    Anim anim;
    Menu *menu;
    Sprite *sprite;
    u32 level = D_800C4EDE;
    s16 i;
    s16 n;
    u16 id;
    s32 *list;
    Game *game;

    if (level >= 50) {
        D_800C0184 = D_800C1DD8;
    } else {
        D_800C0184 = D_800C1D80;
    }
    D_8007A2B0 = func_80032E00(0, 0x62);
    n = 0;
    for (i = 0; i < 49; i++) {
        id = D_800C4B5C[D_8007A288][i];
        if (id != 0xFFFF) {
            D_8007A2B0[n++] = id;
        }
    }
    D_800C01AC.count = n;
    D_8007A2B4 = n;
    if (n == 0) {
        D_800C01AC.count = 1;
    }
    list = obj->tail.list;
    for (i = 1; i < 75; i++) {
        list[i] = 0;
    }
    list[0] = 75;
    func_8003A600(1, 0);
    D_8006B9E0 = 30;
    for (i = 0; i < 30; i++) {
        D_8006B9E4[i] = i;
    }
    func_80024694();
    func_800DD694(0x48, 0x13, 0xC);
    func_800D54E4(1);
    menu = func_800DD634();
    menu->x14[0] = D_800892D8[0];
    menu->x14[1] = D_800892D8[1];
    menu->x14[2] = D_800892D8[2];
    menu->x14[3] = D_800892D8[3];
    menu->x14[4] = D_800892D8[4];
    menu->x14[5] = D_800892D8[5];
    menu->x14[6] = D_800892D8[6];
    menu->x14[7] = D_800892D8[7];
    func_80016FF4(D_800892D8[4]);
    func_80016FF4(D_800892D8[5]);
    func_80016FF4(D_800892D8[6]);
    func_80016FF4(D_800892D8[7]);
    func_80016FF4(D_800892D8[0]);
    func_80016FF4(D_800892D8[1]);
    func_80016FF4(D_800892D8[2]);
    func_80016FF4(D_800892D8[3]);
    D_800C01AC.x22 = 0x12;
    obj->x34 = 0x680;
    obj->x2C = 0;
    obj->x30 = 0xFA;
    func_800D6060(0x678, &D_800C01AC, obj);
    spec.kind = 0x670;
    spec.x10 = 6;
    spec.list = obj->tail.list;
    spec.x08 = 0;
    sprite = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    sprite->x1C = 0x140;
    obj->x3C = sprite;
    anim.x06 = 1;
    anim.x04 = 0;
    anim.x07 = 10;
    anim.sprite = sprite;
    func_800DD82C(&anim);
    for (i = 0; i < 6; i++) {
        obj->tail.fields.data.x154[i] = D_800BFFE8[i].value;
    }
    obj->tail.fields.data.named.x168 = &D_800C4AD4[D_8007A288];
    obj->tail.fields.x16C = D_800C017C[D_800C4B44[D_8007A288]];
    obj->x6C = func_80016FD4();
    func_80016FC4(D_80084F40);
    D_80087938 = func_80032E00(0, 0x88);
    func_80033308(0, D_80087938, 0x88, 0);
    game = D_80087938;
    game->x28 = -1;
    game->x38 = 0;
    game->x2C = -1;
    game->x3C = 0;
    game->x04 = 4;
    game->x06 = 0;
    game->x08 = 0;
    game->x10 = 0;
    game->x34 = D_800C391C[D_80071A28[D_800C4B44[D_8007A288]]];
    game->x74 = D_800C48B8[D_800C4B44[D_8007A288]];
    D_800892B4[1] = D_800C4B44[D_8007A288];
    func_80017B80(D_80087938->x74);
    menu->x48 = D_80087938->x74;
    if (D_8007A2B4 != 0) {
        func_800A3FD4(1, D_80087938);
    }
    D_800BDFAC = -1;
    D_800BDFB0 = 0;
}
