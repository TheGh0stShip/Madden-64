#include "types.h"
typedef struct { u8 pad00[2]; u8 a; u8 b; u8 state; } Slot;
typedef struct { s32 kind; s16 a; s16 b; s16 c; s16 pad; s32 d; s32 e; s32 pad2[4]; } Spec;
typedef struct { u8 pad00[0x2C]; s32 x2C; s32 x30; s32 x34; u8 pad38[0x3C]; s32 list[0x5A]; } Obj;
typedef struct { s8 count; s8 team; } SlotTable;
extern SlotTable D_800C4AD2;
extern u16 D_8006B9D8;
extern u16 D_80084F40;
extern s16 D_800C3A1C;
extern s32 D_800C504C;
extern s32 D_800C3A10;
extern s16 D_800C502C;
extern u8 D_800C0218[];
extern s32 D_800C040C;
void func_800DD634(void);
void func_80024EDC(s32);
u32 func_8009CC68(s16);
Slot *func_8009D69C(s32, s32);
s16 func_80016FD4(void);
void func_80016FC4(u16);
s32 func_8000D8DC(s32, Spec *);
void func_80016FE4(s32);
void func_800D6060(s32, u8 *, Obj *);
void func_8009CCA4(s32, s32, s16, s32 *);

void func_8009C128(Obj *obj) {
    Spec spec;
    u32 i;
    s32 *list;
    Slot *slot;
    s8 *team;

    func_800DD634();
    if (D_8006B9D8 == 3) {
        func_80024EDC(4);
    }
    i = 0;
    team = &D_800C4AD2.team;
    for (; i < func_8009CC68(*team); i++) {
            slot = func_8009D69C(*team, i);
            if (slot->state == 1) {
                slot->state = 0;
            }
    }
    list = obj->list;
    D_800C3A1C = func_80016FD4();
    func_80016FC4(D_80084F40);
    spec.a = 4;
    spec.b = 0;
    spec.c = 0;
    spec.e = 0;
    spec.d = 0x10;
    spec.kind = 0;
    D_800C504C = func_8000D8DC(0, &spec);
    func_80016FE4(D_800C504C);
    spec.d = 0x10;
    spec.kind = 1;
    D_800C3A10 = func_8000D8DC(0, &spec);
    func_80016FE4(D_800C3A10);
    for (i = 1; i < 0x5A; i++) {
        list[i] = 0;
    }
    list[0] = 0x5A;
    D_800C502C = D_800C4AD2.team;
    D_800C0218[1] = func_8009CC68(D_800C502C);
    D_800C0218[0] = 5;
    obj->x34 = 0x298;
    obj->x2C = 0;
    obj->x30 = 0xFA;
    func_800D6060(0x290, D_800C0218, obj);
    func_8009CCA4(0, 0x33, D_800C502C, list);
    list[0x34] = (s32)&D_800C040C;
}
