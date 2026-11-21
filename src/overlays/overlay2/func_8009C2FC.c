#include "types.h"

typedef struct { u8 unk0; u8 unk1; u8 a; u8 b; u8 state; s8 unk5; } Slot;
typedef struct { u8 pad00[8]; u16 x08; u8 pad0A[0x3A]; s32 x44; } Panel;
typedef struct { u8 pad00[0xC]; Panel *panel; } Group;
typedef struct { u8 pad00[0x14]; s32 unk14; } Node;
typedef struct {
    u8 pad00[0x24];
    Group *group;
    u8 pad28[0x10];
    Node *node;
    u8 pad3C[0x38];
    s32 list[0x5A];
} Obj;
typedef struct {
    s32 items[3];
    void *unkC;
    void *unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
} Request;
typedef struct Overlay2RuntimeAB810 {
    u8 pad00[0x44];
    s32 field44[1];
} Overlay2RuntimeAB810;

extern u8 D_8006BCA4[];
extern u8 D_8006BCA8[];
extern u8 D_800C0928[];
extern s32 D_800C3A10;
extern s8 D_800C4AD3;
extern u16 D_800C4B5C[][49];
extern s16 D_800C502C;
extern s32 D_800C504C;

s32 func_80024F5C();
extern s32 func_80030DF0(void);
extern u16 func_80031A1C(s32 range);
extern u8 *func_8003AA28(u16 index);
void func_8009CC10(Node *, u8, Obj *);
u32 func_8009CC68(s16);
void func_8009CCA4(s32, s32, s16, s32 *);
void func_8009CDAC(void);
Slot *func_8009D69C(s32, s32);
void func_8009DA6C(s32);
void func_800A3E7C(void);
u16 func_800D20A0(u8 *, s32, u8);
void func_800D63B4(Obj *);
extern s16 func_800D6454(Request *);
extern void func_800D67B8(Request *);
void func_800DB0AC(Panel *, s32, s32);
extern void func_800DB44C(Panel *, s32 *, u32 *, s32 *);
void func_800DB478(Panel *);
Overlay2RuntimeAB810 *func_800DD634(void);
void func_800DF6EC(void);
void func_800DF72C(void);

void func_8009C2FC(Obj *arg0, s32 arg1, s16 arg2) {
    Request req;
    u8 table[16] = { 3, 6, 7, 8, 9, 14, 18, 21, 24, 28, 31, 33, 35, 42, 49, 56 };
    Obj *obj = arg0;
    s32 col;
    u32 row;
    s32 unused;
    Overlay2RuntimeAB810 *rt;
    Panel *panel;
    s32 buttons;
    Slot *slot;
    u32 i;
    u32 j;
    s32 count;
    u32 first;
    s32 empty;
    u32 sumA;
    u32 sumB;

    rt = func_800DD634();
    panel = obj->group->panel;
    func_800DB44C(panel, &col, &row, &unused);
    buttons = func_80030DF0();
    if ((buttons & 4) && D_800C502C == D_800C4AD3) {
        slot = func_8009D69C(D_800C502C, row);
        if (!(slot->state & 0xF)) {
            func_800DF72C();
            if (slot->unk5 == 1) {
                slot->unk5 = 0;
                rt->field44[col] = D_800C504C;
            } else {
                slot->unk5 = 1;
                rt->field44[col] = D_800C3A10;
            }
        }
    }
    if ((buttons & 0x9000) && D_800C502C == D_800C4AD3) {
        count = 0;
        first = -1;
        empty = 0;
        for (i = 0; i < func_8009CC68(D_800C502C); i++) {
            slot = func_8009D69C(D_800C502C, i);
            if (slot->unk5 == 1 && slot->state == 0) {
                if (count == 0) {
                    first = i;
                }
                count++;
            }
            empty += slot->state == 0;
        }
        if (count == 0 && empty != 0) {
            func_800DF72C();
            func_800D67B8(&req);
            req.items[0] = (s32)D_800C0928;
            req.unkC = D_8006BCA4;
            req.unk10 = D_8006BCA8;
            req.unk18 = 1;
            if (func_800D6454(&req) == 0) {
                for (i = 0; i < func_8009CC68(D_800C502C); i++) {
                    slot = func_8009D69C(D_800C502C, i);
                    if (slot->unk5 != 0) {
                        continue;
                    }
                    if (slot->state != 0) {
                        continue;
                    }
                    sumB = 0;
                    sumA = 0;
                    for (j = 0; j < 0x31; j++) {
                        if (D_800C4B5C[slot->unk0][j] != 0xFFFF) {
                            sumA += func_800D20A0(func_8003AA28(D_800C4B5C[slot->unk0][j]), 0, 0xFF);
                        }
                        if (D_800C4B5C[slot->unk1][j] != 0xFFFF) {
                            sumB += func_800D20A0(func_8003AA28(D_800C4B5C[slot->unk1][j]), 0, 0xFF);
                        }
                    }
                    if (sumB < sumA && func_80031A1C(10) < 6) {
                        slot->a = table[func_80031A1C(12) + 3];
                        slot->b = slot->a + 1;
                        while (slot->b >= slot->a) {
                            slot->b = table[func_80031A1C(10)];
                        }
                    } else {
                        slot->b = table[func_80031A1C(12) + 3];
                        slot->a = slot->b + 1;
                        while (slot->a >= slot->b) {
                            slot->a = table[func_80031A1C(10)];
                        }
                    }
                    slot->state = 8;
                }
                func_8009CDAC();
                func_800DB0AC(panel, 0, 0);
                panel->x08 = func_8009CC68(D_800C502C);
                func_800DB478(panel);
            }
        } else if (empty != 0) {
            func_800DF72C();
            func_8009DA6C(first);
            func_800A3E7C();
        }
    }
    if (arg2 == 2) {
        if (D_800C502C > 0) {
            func_800DF6EC();
            D_800C502C--;
            func_800DB0AC(panel, 0, 0);
            panel->x08 = func_8009CC68(D_800C502C);
            func_800DB478(panel);
            func_8009CCA4(panel->x44, 0x33, D_800C502C, obj->list);
        }
    }
    if (D_800C4AD3 >= 3) {
        if (arg2 == 3 && D_800C502C < D_800C4AD3) {
            func_800DF6EC();
            D_800C502C++;
            func_800DB0AC(panel, 0, 0);
            panel->x08 = func_8009CC68(D_800C502C);
            func_800DB478(panel);
            func_8009CCA4(panel->x44, 0x33, D_800C502C, obj->list);
        }
    } else {
        if (arg2 == 3 && D_800C502C < 2) {
            func_800DF6EC();
            D_800C502C++;
            func_800DB0AC(panel, 0, 0);
            panel->x08 = func_8009CC68(D_800C502C);
            func_800DB478(panel);
            func_8009CCA4(panel->x44, 0x33, D_800C502C, obj->list);
        }
    }
    switch (arg2) {
    case 0xD:
        func_8009CC10(obj->node, 0, obj);
        obj->node->unk14 |= 1;
        break;
    case 0xC:
        func_800D63B4(obj);
        break;
    case 0x11:
        func_80024F5C();
        break;
    }
}
