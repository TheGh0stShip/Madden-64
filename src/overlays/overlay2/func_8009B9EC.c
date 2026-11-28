#include "types.h"

typedef struct {
    s32 sprite;
    s16 x04;
    u8 x06;
    u8 x07;
} Anim;

typedef struct {
    u8 pad00[0xC];
    void *panel;
} Holder;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Node;

typedef struct {
    u8 pad00[0xD];
    u8 name;
    u8 uniform;
    u8 number;
    u8 position;
    u8 pad11[0x13];
    u8 id_hi;
    u8 id_lo;
} Player;

typedef struct {
    s32 value;
    s32 unk4;
} Pair;

typedef struct {
    u8 pad00[0x24];
    Holder *holder;
    s32 unk28;
    u8 pad2C[0xC];
    Node *unk38;
    s32 unk3C;
    u8 pad40[0x38];
    u8 *unk78;
    Player *unk7C;
    u8 *unk80;
    u8 *unk84;
    s32 unk88;
    u8 pad8C[0xC8];
    s32 unk154[6];
} Screen;

typedef struct {
    s8 count;
} SlotTable;

typedef struct Game Game;

extern Game *D_80087938;
extern s32 D_800BDFAC;
extern s32 D_800BDFB0;
extern u8 D_8007A2B4;
extern u16 *D_8007A2B0;
extern s16 D_800E7A90;
extern s8 D_8007A288;
extern u8 D_800C4B44[];
extern u8 D_8007A284[];
extern u8 D_800C5D38[];
extern u8 D_800C5D40[];
extern s32 D_800E6B78[];
extern Pair D_800BFFE8[];
extern u8 D_800C4EDE;
extern SlotTable D_800C4AD2;
extern u8 D_800C0178[];

void func_800A3FD4(s32, Game *);
void func_800DB44C(void *record, s32 *left, s32 *value, s32 *right);
Player *func_8003AA28(u16);
void func_800D5290(s16, s32);
void func_8001F25C(s32, s16, s32);
void func_8001F2B4(s32, Player *);
void func_800167FC(s16, u8 *);
void func_8003E850(u8, u8 *);
void func_8001EC20(s32, s32);
void func_8009C0D0(Node *, s32, Screen *);
void func_800D63B4(Screen *);
void func_800DD82C(Anim *);
void func_800DF72C(void);
void func_800DD4B8(void);
void func_800DD5B8(u8 *);

/* Player-card screen input handler: refreshes the shown player and stat page
 * when the list cursor moved, then dispatches the pad event (cycle team,
 * back, exit). `refresh` is never assigned: the target tests v0 unset.
 * Its switch jump table lives in resident low_rodata (D_80001B08). */
void func_8009B9EC(void *arg0, s32 arg1, s16 input) {
    Screen *screen = arg0;
    Anim anim;
    s32 left;
    s32 value;
    s32 right;
    s32 refresh;
    s32 sprite;
    s32 group;
    Player *player;
    u32 i;

    sprite = screen->unk3C;
    group = screen->unk28;
    if (refresh) {
        func_800A3FD4(1, D_80087938);
    }
    func_800DB44C(screen->holder->panel, &left, &value, &right);
    if (value != D_800BDFAC && D_8007A2B4 != 0) {
        player = func_8003AA28(D_8007A2B0[value]);
        D_800E7A90 = (player->id_hi << 8) | player->id_lo;
        func_800D5290(D_800E7A90, 0);
        func_8001F25C(0, D_800C4B44[D_8007A288], 0);
        func_8001F2B4(0, player);
        func_800167FC(player->name, D_8007A284);
        screen->unk78 = D_8007A284;
        screen->unk7C = player;
        func_8003E850(player->position, D_800C5D38);
        screen->unk80 = D_800C5D38;
        func_800167FC(player->number + 0x91, D_800C5D40);
        screen->unk84 = D_800C5D40;
        screen->unk88 = D_800E6B78[player->uniform & 0x3F];
        func_8001EC20(sprite, 1);
        func_8001EC20(sprite, 2);
        func_8001EC20(sprite, 3);
        func_8001EC20(sprite, 4);
        func_8001EC20(sprite, 5);
        D_800BDFAC = value;
    }
    if (right != D_800BDFB0) {
        for (i = 0; i < 6; i++) {
            screen->unk154[i] = D_800BFFE8[i + right].value;
            func_8001EC20(group, i + 0x38);
        }
        D_800BDFB0 = right;
    }
    switch (input) {
    case 13:
        func_8009C0D0(screen->unk38, 0, screen);
        screen->unk38->flags |= 1;
        break;
    case 12:
        func_800D63B4(screen);
        anim.x04 = 0x140;
        anim.x06 = 0;
        anim.x07 = 10;
        anim.sprite = screen->unk3C;
        func_800DD82C(&anim);
        break;
    case 4:
        if (D_800C4EDE >= 50) {
            func_800DF72C();
            D_8007A288 = (D_8007A288 != 0) ? D_8007A288 - 1 : D_800C4AD2.count - 1;
            func_800DD5B8(D_800C0178);
        }
        break;
    case 5:
        if (D_800C4EDE >= 50) {
            func_800DF72C();
            D_8007A288 = (D_8007A288 + 1) % D_800C4AD2.count;
            func_800DD5B8(D_800C0178);
        }
        break;
    case 8:
    case 17:
    case 28:
        func_800DF72C();
        func_800DD4B8();
        break;
    }
}
