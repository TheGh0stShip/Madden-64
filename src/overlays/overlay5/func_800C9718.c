#include "types.h"

typedef struct {
    s8 id;
    u8 pad1[3];
    u8 *name;
} EntryC9718;

typedef struct {
    u8 pad0[0xC];
    EntryC9718 entries[1];
} ListC9718;

typedef struct {
    s32 items[200];
    s16 count;
} TableC9718;

typedef struct {
    u8 pad0[0xD];
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u8 unk10;
    u8 pad11[0x17];
} RecordC9718;

typedef struct {
    u8 pad0[0x8];
    u16 unk8;
    u8 padA[0xE];
    s16 unk18;
    s16 unk1A;
    u8 pad1C[0x28];
    s32 unk44;
} PanelC9718;

typedef struct {
    u8 pad0[0x14];
    s32 flags;
} TargetC9718;

typedef struct {
    u8 pad0[0xC];
    s32 unkC;
} InnerC9718;

typedef struct {
    u8 pad0[0xC];
    InnerC9718 *unkC;
    u8 pad10[0x19];
    u8 unk29;
} ScreenC9718;

typedef struct {
    u8 pad0[0xC];
    ScreenC9718 *unkC;
} RootC9718;

typedef struct {
    u8 pad0[0xC];
    PanelC9718 *unkC;
} HolderC9718;

typedef struct {
    u8 pad0[0x44];
    s32 unk44;
} StateC9718;

typedef struct {
    RootC9718 *unk0;
    u8 pad4[0xC];
    TargetC9718 *unk10;
    u8 pad14[0x10];
    HolderC9718 *unk24;
    u8 pad28[0x10];
    TargetC9718 *unk38;
    u8 pad3C[0x3C];
    u8 *unk78[1];
    u8 *unk7C[5];
    void *unk90;
    u8 pad94[8];
    void *unk9C;
    void *unkA0;
    void *unkA4;
    u8 padA8[4];
    void *unkAC;
    u8 padB0[4];
    void *unkB4;
} OwnerC9718;

typedef struct {
    u8 *name;
    s32 unk4;
} SlotC9718;

extern void func_8000BE80(void);
extern void func_8000CDC0(void);
extern void func_8000DA98(s32);
extern void func_800167FC(s32, void *);
extern void func_8001EC20(s32, s32);
extern void func_8001F2B4(s32, RecordC9718 *);
extern void func_8001F81C(s32, u16);
extern void func_80032F3C(s32, void *);
extern void func_800334B8(void);
extern s16 func_800397C8(u16, u16);
extern void func_8003E850(s32, void *);
extern void func_800CA2C8(TargetC9718 *, s32, OwnerC9718 *);
extern void func_800D5E0C(ScreenC9718 *, s32, s32, TargetC9718 *);
extern void func_800D63B4(OwnerC9718 *);
extern void func_800DB0AC(PanelC9718 *, s32, s32);
extern void func_800DB478(PanelC9718 *);
extern StateC9718 *func_800DD634(void);
extern void func_800DE84C(void *);
extern void func_800DF72C(void);
extern void *func_800E0124(RootC9718 *);
extern s32 func_800E0170(RootC9718 *);
extern TableC9718 *overlay5_flagged_operation_dispatch(s32, s32, EntryC9718 *, s16, ListC9718 *);
extern void overlay5_indexed_assignment_update(s16, s32);
extern s32 overlay5_linked_index_get(void *);
extern void overlay5_record_extents_get(PanelC9718 *, s32 *, s32 *, s32 *);
extern void overlay5_resource_linked_entry_apply(RootC9718 *, void *);
extern void overlay5_runtime_event_stop(OwnerC9718 *);
extern void overlay5_runtime_stack_advance(void);

extern u8 D_8006BFA0[];
extern s8 D_80072140[];
extern s32 D_8007214C;
extern s32 D_80072150;
extern s16 D_80072154;
extern ListC9718 *D_80072158[];
extern u8 D_8007A2B8[];
extern u8 D_8007A2C0[];
extern u8 D_8007A2C4[];
extern s16 D_8007A2CC[];
typedef struct {
    u8 pad0[0x85];
    RecordC9718 records[209];
    u8 pad212D[0x1F];
} TeamC9718;

extern TeamC9718 D_80080CE5[];
extern SlotC9718 *D_80085134;
extern s16 D_8008A6C2;
extern ListC9718 *D_8008AF74;
extern s16 D_8008AFC8;
extern TableC9718 *D_8008B25C;
extern u8 D_800E5F60[];
extern void *D_800E6B78[];
extern s8 D_800E6E3C;
extern s8 D_800E6E3D;
extern u8 D_800E6E44[];
extern u8 D_800E6E54[];
extern u8 D_800E6E64[];
extern s16 D_800E7A90;
extern s16 D_800E7A98;

void func_800C9718(OwnerC9718 *owner, s32 unused, s32 mode) {
    RootC9718 *root;
    PanelC9718 *panel;
    s32 handle;
    s32 first;
    s32 row;
    s32 page;
    RecordC9718 *record;
    StateC9718 *state;
    s32 value;
    s8 i;
    u8 *p;
    void *link;
    s8 limit;
    TableC9718 *table;

    root = owner->unk0;
    panel = owner->unk24->unkC;
    handle = func_800E0170(root);
    overlay5_record_extents_get(panel, &first, &row, &page);
    if (row != D_8007214C) {
        if (D_8008B25C->count > 0) {
            D_800E7A90 = func_800397C8(D_8007A2CC[D_80072154], D_8008B25C->items[row]);
            overlay5_indexed_assignment_update(D_800E7A90, 0);
            record = &D_80080CE5[D_8007A2CC[D_80072154]].records[D_8008B25C->items[row]];
            owner->unk9C = record;
            func_800167FC(record->unkD, D_8007A2B8);
            owner->unk90 = D_8007A2B8;
            func_8003E850(record->unk10, D_8007A2C4);
            owner->unkA0 = D_8007A2C4;
            func_800167FC(record->unkF + 0x91, D_8007A2C0);
            owner->unkA4 = D_8007A2C0;
            owner->unkAC = D_800E6B78[record->unkE & 0x3F];
            func_8001EC20(handle, 7);
            func_8001EC20(handle, 0xA);
            func_8001EC20(handle, 0xB);
            func_8001EC20(handle, 0xC);
            func_8001EC20(handle, 0xE);
            owner->unkB4 = &D_80080CE5[D_8007A2CC[D_80072154]];
            func_8001EC20(handle, 0x10);
            D_8007214C = row;
            func_8001F2B4(0, record);
        }
        if (row != D_8007214C && D_8008B25C->count == 0) {
            state = func_800DD634();
            value = state->unk44;
            if (value != 0) {
                func_8000BE80();
                func_8000DA98(value);
                state->unk44 = 0;
                D_800E7A98 = -1;
            }
            owner->unk90 = D_8006BFA0;
            owner->unk9C = D_8006BFA0;
            owner->unkA0 = D_8006BFA0;
            owner->unkA4 = D_8006BFA0;
            owner->unkAC = D_8006BFA0;
            owner->unkB4 = D_8006BFA0;
            func_8001EC20(handle, 7);
            func_8001EC20(handle, 0xA);
            func_8001EC20(handle, 0xB);
            func_8001EC20(handle, 0xC);
            func_8001EC20(handle, 0xE);
            func_8001EC20(handle, 0x10);
            D_8007214C = row;
        }
    }
    if (page != D_80072150) {
        for (i = 0; i < 4; i++) {
            owner->unk78[D_80072140[i]] = D_8008AF74->entries[i + page].name;
            p = D_8008AF74->entries[i + page].name;
            while (*p++ != 0) {
            }
            owner->unk7C[D_80072140[i]] = p;
            func_8001EC20(panel->unk44, D_80072140[i] + 1);
            func_8001EC20(panel->unk44, D_80072140[i] + 2);
        }
        D_80072150 = page;
    }

    switch ((s16)mode) {
    case 13:
        func_800D5E0C(owner->unk0->unkC, owner->unk0->unkC->unkC->unkC, owner->unk0->unkC->unk29, owner->unk10);
        owner->unk10->flags &= ~1;
        func_800CA2C8(owner->unk38, 0, owner);
        owner->unk38->flags |= 1;
        break;
    case 8:
    case 28:
        func_800DF72C();
        func_800DE84C(D_800E5F60);
        overlay5_runtime_stack_advance();
        break;
    case 12:
        overlay5_runtime_event_stop(owner);
        func_800D63B4(owner);
        break;
    case 26:
        link = func_800E0124(owner->unk0);
        func_8000CDC0();
        func_800334B8();
        if (link == D_800E6E44) {
            func_80032F3C(0, D_8008B25C);
            D_80072154 = overlay5_linked_index_get(link);
            func_8001F81C(0, D_8007A2CC[D_80072154]);
            D_8008B25C = overlay5_flagged_operation_dispatch(0x20002, 0x37, &D_8008AF74->entries[D_8008AFC8],
                                                            D_8007A2CC[D_80072154], D_8008AF74);
            D_8008A6C2 = 0;
            while (D_8008AF74->entries[D_8008A6C2].id != -1) {
                D_8008A6C2++;
            }
            func_800DB0AC(panel, 0, 0);
            panel->unk8 = D_8008B25C->count;
            panel->unk1A = 0;
            panel->unk18 = D_8008A6C2 + 1;
            if (panel->unk8 == 0) {
                panel->unk8 = 1;
                panel->unk18 = 1;
            }
            func_800DB478(panel);
            D_8007214C = -1;
        }
        if (link == D_800E6E54) {
            func_80032F3C(0, D_8008B25C);
            D_8008AF74 = D_80072158[overlay5_linked_index_get(link)];
            D_8008AFC8 = 0;
            D_8008B25C = overlay5_flagged_operation_dispatch(0x20002, 0x37, &D_8008AF74->entries[0],
                                                            D_8007A2CC[D_80072154], D_8008AF74);
            D_8008A6C2 = 0;
            while (D_8008AF74->entries[D_8008A6C2].id != -1) {
                D_8008A6C2++;
            }
            limit = 4;
            if (D_8008A6C2 < 4) {
                limit = D_8008A6C2;
            }
            panel->unk18 = D_8008A6C2 + 1;
            for (i = 0; i < 4; i++) {
                if (i < limit) {
                    owner->unk78[D_80072140[i]] = D_8008AF74->entries[i].name;
                    p = D_8008AF74->entries[i].name;
                    while (*p++ != 0) {
                    }
                    owner->unk7C[D_80072140[i]] = p;
                } else {
                    owner->unk78[D_80072140[i]] = D_8006BFA0;
                    owner->unk7C[D_80072140[i]] = D_8006BFA0;
                }
                func_8001EC20(panel->unk44, D_80072140[i] + 1);
                func_8001EC20(panel->unk44, D_80072140[i] + 2);
            }
            func_800DB0AC(panel, 0, 0);
            panel->unk8 = D_8008B25C->count;
            panel->unk1A = 0;
            if (D_8008B25C->count == 0) {
                panel->unk8 = 1;
                panel->unk18 = 1;
            }
            D_8007214C = -1;
            for (i = 0; i < D_8008A6C2; i++) {
                D_80085134[i].name = D_8008AF74->entries[i].name;
                D_80085134[i].unk4 = 0;
            }
            D_800E6E3D = 0;
            D_800E6E3C = D_8008A6C2;
            overlay5_resource_linked_entry_apply(root, D_800E6E64);
            func_800DB478(panel);
        }
        if (link == D_800E6E64) {
            func_80032F3C(0, D_8008B25C);
            D_8008AFC8 = overlay5_linked_index_get(link);
            table = overlay5_flagged_operation_dispatch(0x20002, 0x37, &D_8008AF74->entries[D_8008AFC8],
                                                       D_8007A2CC[D_80072154], D_8008AF74);
            panel->unk8 = table->count;
            D_8008B25C = table;
            if (table->count == 0) {
                panel->unk8 = 1;
                panel->unk18 = 1;
            }
            func_800DB478(panel);
            D_8007214C = -1;
        }
        break;
    }
}
