#include "types.h"

typedef struct SetupD9824 {
    u16 unk_00;
    void *unk_04;
    s32 unk_08;
    s32 unk_0C;
    s16 unk_10;
} SetupD9824;

typedef struct SubD9824 {
    u8 pad00[0x10];
    void *unk_10;
} SubD9824;

typedef struct ChildD9824 {
    u8 pad00[0x8];
    SubD9824 *unk_08;
    u8 pad0C[0x8];
    s32 unk_14;
    u8 pad18[0x4];
    s32 field1C;
    s32 field20;
    u8 pad24[0x1C];
    s32 values40[4];
} ChildD9824;

typedef struct EntryD9824 {
    u8 data[0x14];
} EntryD9824;

typedef struct ResourceBlockD9824 {
    EntryD9824 entries[4];
    ChildD9824 *items[4];
    s16 widths[4];
    s32 values68[4];
} ResourceBlockD9824;

typedef struct ObjectD9824 {
    u8 pad00[0x3C];
    ChildD9824 *field3C;
    ChildD9824 *field40;
    u8 pad44[0x1C];
    ResourceBlockD9824 *resources;
    u8 pad64[0x10];
    s32 list[0xB6];
} ObjectD9824;

extern void *D_80087AA8;
extern s32 D_800892E0[2];

extern void *func_80032E00(s32 zero, u32 size);
extern ChildD9824 *func_8000D740(void *list, u16 type, void *argument);
extern void func_80032984(s32 *, s32 *, s32 *, s32 *);
extern void func_8002E65C(u8 *, u8 *);
extern void func_800D3C0C(void *, u16);
extern void func_80092B98(void);
extern void func_800DD694(s32, s32, s32);
extern ChildD9824 *func_800DD634(void);
extern void func_800D6424(ChildD9824 *, s32, s32, s32);

void func_800D9824(ObjectD9824 *object) {
    SetupD9824 setup;
    char *names[4] = { "HORIZ. CENTER", "VERT. CENTER", "HORIZONTAL SCALE", "VERTICAL SCALE" };
    u16 types[4] = { 0x6D0, 0x6D8, 0x6E0, 0x6E8 };
    ResourceBlockD9824 *resources;
    ChildD9824 *child;
    ChildD9824 *state;
    ChildD9824 *other;
    s32 *list;
    s32 width;
    u32 i;

    resources = func_80032E00(0, 0x78);
    list = object->list;
    object->resources = resources;
    object->list[0] = 0xB5;
    for (i = 0; i < 0xB4; i++) {
        list[i + 1] = 0;
    }
    list[i + 1] = 0;
    setup.unk_00 = 0x6C0;
    setup.unk_04 = object->list;
    setup.unk_08 = 0;
    setup.unk_10 = 7;
    child = func_8000D740(D_80087AA8, 1, &setup);
    object->field3C = child;
    child->field1C = 0;
    child->field20 = 0xFA;
    setup.unk_00 = 0x4D0;
    setup.unk_04 = object->list;
    setup.unk_08 = 0;
    setup.unk_10 = 7;
    other = func_8000D740(D_80087AA8, 1, &setup);
    object->field40 = other;
    other->field1C = 0;
    other->field20 = 0xFA;
    func_80032984(&resources->values68[0], &resources->values68[1], &resources->values68[2], &resources->values68[3]);
    setup.unk_10 = 4;
    for (i = 0; i < 4; i++) {
        func_8002E65C(resources->entries[i].data, (u8 *)names[i]);
        list[i + 1] = (s32)&resources->entries[i];
        width = resources->values68[i] + 0x1B;
        resources->widths[i] = width;
        if (i >= 2) {
            resources->widths[i] = width * 2 - 1;
            if (resources->widths[i] > 0x35) {
                resources->widths[i] = 0x35;
            }
        }
        setup.unk_00 = types[i];
        resources->items[i] = func_8000D740(D_80087AA8, 1, &setup);
        func_800D3C0C(resources->items[i]->unk_08->unk_10, (u16)resources->widths[i] * 2 + 0xC2);
        resources->items[i]->field1C = 0;
        resources->items[i]->field20 = 0xFA;
        resources->items[i]->unk_14 |= 1;
        func_80092B98();
    }
    func_800DD694(2, 0xF, 6);
    state = func_800DD634();
    for (i = 1; i < 4; i++) {
        state->values40[i] = state->values40[0];
    }
    state->field1C = D_800892E0[0];
    state->field20 = D_800892E0[1];
    func_800D6424(child, 0, 3, 0xA);
    for (i = 0; i < 4; i++) {
        func_800D6424(resources->items[i], 0, 3, 0xA);
    }
}
