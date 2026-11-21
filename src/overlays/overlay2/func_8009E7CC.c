#include "types.h"

typedef struct {
    u8 pad0[0xC];
    u8 unkC;
} Label;

typedef struct {
    u8 pad0[0x14];
    s32 flags;
    u8 pad18[4];
    s32 unk1C;
    s32 unk20;
} Sprite;

typedef struct {
    u8 pad0[0xC];
    void *panel;
} Holder;

typedef struct {
    u8 pad0[0x24];
    Holder *holder;
    s32 unk28;
    u8 pad2C[0xC];
    Sprite *unk38;
    u8 pad3C[0x24];
    Sprite *unk60;
} Owner;

extern u8 func_80016B70(s16, u8);
extern Label *func_8001B02C(s32);
extern void func_8002E65C(u8 *, u8 *);
extern s32 func_80030DF0(void);
extern u16 func_8004DF94(u8 *);
extern void func_80092B98(void);
extern s16 func_800A78F0(s32, s16, u8 *, s32, Sprite *, s16, Label *, s32, s32);
extern void func_800DB2A4(void *);
extern void func_800DB44C(void *, s32 *, u32 *, s32 *);

extern u8 D_800724FC[];
extern s16 D_800895D2;
extern u8 D_800C4EEC[][13];

void func_8009E7CC(Owner *owner) {
    s32 row;
    u32 col;
    s32 unused;
    void *panel;
    Sprite *spr;
    s16 cursor;
    s16 done;
    Label *label;
    s32 input;
    s16 c;
    u16 len;
    u16 i;

    panel = owner->holder->panel;
    spr = owner->unk60;
    func_800DB44C(panel, &row, &col, &unused);
    c = col;
    cursor = 0;
    func_80092B98();
    done = 0;
    func_80092B98();
    func_80092B98();
    label = func_8001B02C(0x5A0);
    label->unkC = func_80016B70(D_800895D2, D_800C4EEC[(u16)c][0]);
    spr->unk1C = 0x80;
    spr->unk20 = row * 14 + 0x56;
    spr->flags |= 1;
    owner->unk38->flags &= ~1;
    do {
        func_80092B98();
        func_800DB2A4(panel);
        input = func_80030DF0();
        cursor = func_800A78F0(input, cursor, D_800C4EEC[(u16)c], owner->unk28, spr, c, label, 0x80, 0);
        label->unkC = func_80016B70(D_800895D2, D_800C4EEC[(u16)c][cursor]);
        if (input & 0x8000) {
            done = 1;
            len = func_8004DF94(D_800C4EEC[(u16)c]);
            if (len != 0) {
                i = len - 1;
                while (D_800C4EEC[(u16)c][i] == ' ') {
                    if (i == 0) break;
                    D_800C4EEC[(u16)c][i] = 0;
                    i--;
                }
            }
        }
        if (input & 0x4000) {
            func_8002E65C(D_800C4EEC[(u16)c], D_800724FC);
            done = 1;
        }
    } while (done == 0);
    spr->flags &= ~1;
    owner->unk38->flags |= 1;
    func_80092B98();
    func_80092B98();
    func_80092B98();
}
