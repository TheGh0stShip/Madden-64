#include "types.h"

typedef struct {
    u32 count;
    void *entries[30];
} Unk800CF7C8List;

typedef struct {
    u8 pad00[0x14];
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    u8 pad24[0x44 - 0x24];
    s32 unk_44;
} Unk800CF7C8State;

typedef struct {
    s32 unk_00;
    s16 unk_04;
    s16 unk_06;
    s16 unk_08;
    s32 unk_0C;
    s32 unk_10;
    u8 pad14[0x28 - 0x14];
} Unk800CF7C8Desc;

typedef struct {
    s32 count;
    s32 items[0xB5];
} Unk800CF7C8Table;

typedef struct {
    u8 pad00[0x2C];
    s32 unk_2C;
    s32 unk_30;
    s32 unk_34;
    u8 pad38[0x60 - 0x38];
    Unk800CF7C8List *unk_60;
    u8 pad64[0x74 - 0x64];
    Unk800CF7C8Table unk_74;
} Unk800CF7C8Arg;

Unk800CF7C8State *func_800DD634(void);
void *func_80032E00(s32, s32);
u8 func_80029BD4(void);
void func_80029BE4(u8, void *);
s32 func_8000D8DC(s32, Unk800CF7C8Desc *);
void func_80016FE4(s32);
void func_800D6060(s32, void *, void *);
extern s32 D_800892D8[4];
extern u8 D_800E7664;
typedef struct {
    u8 v;
} ByteS;
extern ByteS D_800E7665;
extern ByteS D_800E767C;

void func_800CF7C8(Unk800CF7C8Arg *arg0) {
    Unk800CF7C8State *state;
    Unk800CF7C8List *list;
    Unk800CF7C8Table *table;
    Unk800CF7C8Desc desc;
    u32 i;
    s32 handle;

    state = func_800DD634();
    table = &arg0->unk_74;
    table->count = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        table->items[i] = 0;
    }
    table->items[i] = 0;
    list = func_80032E00(0, 0x7C);
    arg0->unk_60 = list;
    list->count = func_80029BD4();
    for (i = 0; i < list->count; i++) {
        list->entries[i] = func_80032E00(0, 0xC);
        func_80029BE4(i, list->entries[i]);
    }
    state->unk_1C = 0;
    state->unk_20 = 0;
    if (list->count == 0) {
        D_800E767C.v = 0xFF;
        state->unk_14 = 0;
        state->unk_18 = 0;
        D_800E7665.v = 3;
    } else {
        D_800E767C.v = 5;
        state->unk_14 = D_800892D8[0];
        state->unk_18 = D_800892D8[1];
        D_800E7665.v = list->count;
    }
    desc.unk_04 = 0;
    desc.unk_06 = 0;
    desc.unk_08 = 0;
    desc.unk_10 = 0;
    desc.unk_0C = 0;
    desc.unk_00 = 0x82;
    handle = func_8000D8DC(0, &desc);
    func_80016FE4(handle);
    state->unk_44 = handle;
    arg0->unk_2C = 0;
    arg0->unk_30 = 0xFA;
    arg0->unk_34 = 0;
    func_800D6060(0x4A0, &D_800E7664, arg0);
}
