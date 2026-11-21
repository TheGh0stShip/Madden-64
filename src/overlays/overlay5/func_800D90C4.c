#include "types.h"

typedef struct NodeD90C4 {
    u8 pad00[0x10];
    s32 unk_10;
} NodeD90C4;

typedef struct ItemD90C4 {
    u8 pad00[8];
    NodeD90C4 *unk_08;
    u8 pad0C[8];
    s32 flags;
} ItemD90C4;

typedef struct ResourceBlockD90C4 {
    u8 pad00[0xF0];
    u8 ids[12];
    ItemD90C4 *items[12];
    u16 counts[12];
} ResourceBlockD90C4;

typedef struct ObjectD90C4 {
    u8 pad00[0x3C];
    void *field3C;
    ItemD90C4 *field40;
    u8 pad44[0x1C];
    ResourceBlockD90C4 *resources;
} ObjectD90C4;

typedef struct SetupD90C4 {
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    s16 unk_10;
} SetupD90C4;

extern s32 D_800E6C30;
extern u8 D_8006C9DC[];

extern void *func_800DD634(void);
extern void func_800D9764(void *, ItemD90C4 *, s32, s32, s32);
extern u32 func_80030C74(s32 *);
extern void overlay5_resource_mode_notify(void);
extern void func_800D3C0C(s32, u16);
extern void func_800D67EC(u8 *, s32);
extern void func_8003E460(void);
extern void func_80092B98(void);
extern void func_800DF72C(void);
extern void func_8001FA50(s32 group, s32 value);
extern void overlay5_packed_event_dispatch(void *, s32, s32, s32);
extern void overlay5_runtime_stack_advance(void);

void func_800D90C4(ObjectD90C4 *object, s32 arg1, s16 arg2) {
    s32 sel = 0;
    SetupD90C4 setup;
    u16 table[8] = { 0xBC, 0xCD, 0xDD, 0xED, 0xFD, 0x10D, 0x11D, 0x12C };
    s32 pad[2];
    s32 done;
    void *owner;
    ItemD90C4 *cursor;
    ResourceBlockD90C4 *resources;
    u32 buttons;
    u32 i;
    u8 changed;
    u32 n;

    done = 0;
    func_800DD634();
    owner = object->field3C;
    cursor = object->field40;
    resources = object->resources;
    if (arg2 == 0xD) {
        func_800D9764(owner, cursor, 0, 0, 1);
        cursor->flags |= 1;
        setup.unk_04 = 0;
        setup.unk_08 = 0;
        setup.unk_10 = 4;
        buttons = func_80030C74(pad);
        while ((((buttons >> 14) ^ 1) & 1) & (done == 0)) {
            if (buttons & 0x2020) {
                buttons = 0x2020;
            }
            switch (buttons) {
                case 0x800:
                    n = (u16)sel;
                    if (n != 0) {
                        overlay5_resource_mode_notify();
                        sel--;
                        func_800D9764(owner, cursor, n - 1, n + 1, n);
                    }
                    break;
                case 0x400:
                    n = (u16)sel;
                    if (n < 0xB) {
                        overlay5_resource_mode_notify();
                        sel++;
                        func_800D9764(owner, cursor, n + 1, n + 1, n + 2);
                    }
                    break;
                case 0x200:
                    if (resources->counts[(u16)sel] != 0) {
                        overlay5_resource_mode_notify();
                        resources->counts[(u16)sel]--;
                        func_800D3C0C(resources->items[(u16)sel]->unk_08->unk_10, table[resources->counts[(u16)sel]]);
                        if (resources->counts[(u16)sel] == 0) {
                            resources->items[(u16)sel]->flags &= ~1;
                        }
                    }
                    break;
                case 0x100:
                    if (resources->counts[(u16)sel] < 7) {
                        overlay5_resource_mode_notify();
                        resources->counts[(u16)sel]++;
                        func_800D3C0C(resources->items[(u16)sel]->unk_08->unk_10, table[resources->counts[(u16)sel]]);
                        resources->items[(u16)sel]->flags |= 1;
                    }
                    break;
                case 0x2020:
                    changed = 0;
                    for (i = 0; i < 12; i++) {
                        if (resources->counts[i] != 0) {
                            resources->counts[i]--;
                            changed = 1;
                            func_800D3C0C(resources->items[i]->unk_08->unk_10, table[resources->counts[i]]);
                            if (resources->counts[i] == 0) {
                                resources->items[i]->flags &= ~1;
                            }
                        }
                    }
                    if (changed == 1) {
                        overlay5_resource_mode_notify();
                    }
                    break;
                case 0x10:
                    changed = 0;
                    for (i = 0; i < 12; i++) {
                        if (resources->counts[i] < 7) {
                            resources->counts[i]++;
                            changed = 1;
                            func_800D3C0C(resources->items[i]->unk_08->unk_10, table[resources->counts[i]]);
                            resources->items[i]->flags |= 1;
                        }
                    }
                    if (changed == 1) {
                        overlay5_resource_mode_notify();
                    }
                    break;
                case 2:
                    func_800D67EC(D_8006C9DC, D_800E6C30 == 2);
                    break;
                case 0x1000:
                case 0x8000:
                    done = 1;
                    break;
            }
            if (D_800E6C30 == 2) {
                func_8003E460();
            } else {
                func_80092B98();
            }
            buttons = func_80030C74(pad);
        }
        func_800DF72C();
        for (i = 0; i < 12; i++) {
            func_8001FA50(resources->ids[i], (s16)resources->counts[i]);
        }
        cursor->flags &= ~1;
        overlay5_packed_event_dispatch(owner, 0xFA, 2, 0xA);
        for (i = 0; i < 12; i++) {
            overlay5_packed_event_dispatch(resources->items[i], 0xFA, 2, 0xA);
        }
        overlay5_runtime_stack_advance();
    }
}
