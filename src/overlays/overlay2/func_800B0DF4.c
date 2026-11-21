#include "types.h"

typedef struct {
    s32 count;
    void *items[0xB5];
} List;

typedef struct Mem {
    u8 pad0[2]; u16 unk2; u8 unk4; u8 pad5[0xC - 5];
    s32 unkC[2]; s32 unk14[2]; s32 unk1C[2]; s32 unk24[2];
    u8 unk2C[0x14];
} Mem;

typedef struct Obj {
    u8 pad0[0x24]; s32 unk24; s32 unk28; s32 unk2C; s32 unk30; s32 unk34; s32 unk38;
    u8 pad3C[0x60 - 0x3C]; Mem *unk60; u8 pad64[0x74 - 0x64]; List list;
} Obj;

typedef struct Desc {
    s32 unk0; s32 unk4; void *unk8; void *unkC; s32 unk10; void *unk14; s8 unk18; s8 unk19;
} Desc;

typedef struct { u8 pad[9]; u8 unk9; } Res;
typedef struct { u8 pad[0x14]; s32 unk14; s32 unk18; s32 unk1C; s32 unk20; } State;

void func_80024694(void);
void func_8002E65C(void *, void *);
Mem *func_80032E00(s32, s32);
void func_800B1648(Obj *);
void func_800B1694(Obj *);
void func_800B17A0(Mem *);
void func_800B17EC(Mem *, u16);
void func_800B1E5C(Mem *);
void func_800B13E8(void);
void func_800B1440(void);
Res *func_800D6060(s32, Desc *, Obj *);
void *func_800DD634(void);
void func_800DD694(s32, s32, s32);
extern s32 D_800892D8;
extern s32 D_800892DC;
extern s32 D_800892E0;
extern s32 D_800892E4;
extern u16 D_800BDF0A;
extern s32 D_800BF9C4[];
extern s32 D_800BF9CC[];
extern void *D_800BF9D4[];
extern s32 D_800BF9D8[];
extern Desc D_800BF9DC;
extern s32 D_800C3024;

void func_800B0DF4(Obj *arg0) {
    void *state;
    List *list;
    Mem *mem;
    Res *r;
    u16 i;

    state = func_800DD634();
    list = &arg0->list;
    list->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list->items[i] = 0;
    }
    list->items[i] = 0;
    mem = func_80032E00(0, 0x40);
    arg0->unk60 = mem;
    mem->unk2 = D_800BDF0A;
    mem->unk4 = 0;
    func_8002E65C(mem->unk2C, &D_800C3024);
    for (i = 0; i < 2; i++) {
        mem->unk24[i] = 0;
        mem->unk14[i] = 0;
        mem->unk1C[i] = 0;
        mem->unkC[i] = 0;
    }
    list->items[0] = mem->unk2C;
    func_80024694();
    func_800B17EC(mem, mem->unk2);
    func_800B1E5C(mem);
    *(s32 *)((u8 *)state + 0x14) = D_800892D8;
    *(s32 *)((u8 *)state + 0x18) = D_800892DC;
    *(s32 *)((u8 *)state + 0x1C) = D_800892E0;
    *(s32 *)((u8 *)state + 0x20) = D_800892E4;
    func_800DD694(0x48, 0x12, 8);
    func_800DD694(0x1B, 8, 4);
    func_800DD694(0x1C, 9, 4);
    func_800DD694(3, 0xA, 4);
    func_800DD694(4, 0xB, 4);
    arg0->unk30 = 0xF0;
    arg0->unk34 = 0x440;
    arg0->unk2C = 0;
    D_800BF9DC.unk8 = D_800BF9C4;
    D_800BF9DC.unk14 = func_800B13E8;
    D_800BF9DC.unk19 = 0x18;
    D_800BF9DC.unk18 = 5;
    D_800BF9DC.unkC = D_800BF9D4;
    r = func_800D6060(0x430, &D_800BF9DC, arg0);
    r->unk9 |= 2;
    mem->unk14[0] = arg0->unk28;
    mem->unk1C[0] = arg0->unk38;
    mem->unk24[0] = arg0->unk24;
    D_800BF9DC.unk8 = D_800BF9CC;
    D_800BF9DC.unk14 = func_800B1440;
    D_800BF9DC.unk19 = 0x34;
    D_800BF9DC.unk18 = 9;
    D_800BF9DC.unkC = D_800BF9D8;
    arg0->unk34 = 0x448;
    r = func_800D6060(0x438, &D_800BF9DC, arg0);
    r->unk9 |= 2;
    mem->unk14[1] = arg0->unk28;
    mem->unk1C[1] = arg0->unk38;
    mem->unk24[1] = arg0->unk24;
    arg0->unk28 = mem->unk14[0];
    arg0->unk38 = mem->unk1C[0];
    arg0->unk24 = mem->unk24[0];
    func_800B1648(arg0);
    func_800B1694(arg0);
    func_800B17A0(mem);
}
