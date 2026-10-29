#include "types.h"

typedef struct {
    u8 pad0[0x14];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
} State;

typedef struct {
    u8 pad0[0x320];
    s16 count;
} IdList;

typedef struct {
    u8 pad0[0x2C];
    s32 unk2C;
    s32 unk30;
    s32 unk34;
    u8 pad38[0x3C];
    s32 slots[85];
    u8 pad1C8[0x98 - 0x74 - 85 * 4 + 0x154];
} Screen;

typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC;
} Defaults;

extern Defaults D_800892D8;
extern u16 D_80084F40;
extern u16 D_800C3A1C;
extern s16 D_800C507C;
extern IdList *D_800C5094;
extern s32 D_800BDF10;
extern s32 D_800BDF34[];
extern u8 D_800BF8E0[];

State *func_800DD634(void);
void func_80016FE4(s32);
u16 func_80016FD4(void);
void func_80016FC4(u16);
void func_8008DA98(void);
IdList *func_800D3FF4(s32, s32, s32, s32, s32);
void func_800D6060(s32, u8 *, Screen *);

void func_800AFBE4(Screen *screen) {
    State *state = func_800DD634();
    IdList *list;
    s8 i;
    s32 *slots;

    state->unk14 = D_800892D8.unk0;
    state->unk18 = D_800892D8.unk4;
    state->unk1C = D_800892D8.unk8;
    state->unk20 = D_800892D8.unkC;
    func_80016FE4(state->unk1C);
    func_80016FE4(state->unk20);
    slots = screen->slots;
    D_800C3A1C = func_80016FD4();
    func_80016FC4(D_80084F40);
    for (i = 1; i < 0x55; i++) {
        slots[i] = 0;
    }
    func_8008DA98();
    slots[0] = 0x54;
    D_800C507C = 0;
    list = func_800D3FF4(D_800BDF10 | 1, 0x1E, 0, 0, 0);
    D_800BF8E0[1] = list->count;
    D_800C5094 = list;
    if (list->count < 8) {
        list->count = 8;
    }
    screen->unk34 = 0x298;
    screen->unk2C = 0;
    screen->unk30 = 0xFA;
    func_800D6060(0x2C8, D_800BF8E0, screen);
    *(s32 *)((u8 *)screen + 0x98) = D_800BDF34[D_800C507C];
}
