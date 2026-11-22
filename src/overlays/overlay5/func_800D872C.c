#include "types.h"

typedef struct {
    char names[14][17];
    s16 labels[14];
    s16 ids[14];
    u8 colors[14];
} Table;

typedef struct {
    s32 object;
    s16 width;
    u8 flags;
    u8 height;
} Rebuild;

typedef struct {
    u8 pad0[0xC];
    s32 unkC;
} Sub24;

typedef struct {
    u8 pad0[0x14];
    s32 unk14;
} Sub38;

typedef struct {
    u8 pad0[8];
    s32 unk8;
    u8 padC[0x18];
    Sub24 *unk24;
    u8 pad28[0x10];
    Sub38 *unk38;
    u8 pad3C[0x3C];
    void *unk78;
    s32 unk7C;
    void *unk80;
    u8 pad84[0x1C];
    void *unkA0;
    u8 padA4[0x54];
    void *unkF8;
} Obj;

extern s32 D_800E6C38;
extern s16 D_800E7A90[];
extern u8 D_80002234;
extern char D_8000223C[];
extern u8 D_8006BFA0;
extern u8 D_800C2EE0;
extern char D_8007A3B8[];
extern char D_8007A3BC[];
extern char D_8007A3D0[];
extern s32 D_8006E9FC[];

extern void overlay5_record_extents_get(s32, s32 *, s32 *, s32 *);
extern s32 overlay5_data_record_copy_verified(void *, void *, s32);
extern void func_8001F754(s32);
extern u8 *func_8003AA28(u16);
extern void func_8001F25C(s32, s32, s32);
extern void func_8001F2B4(s32, u8 *);
extern void func_800167FC(s32, char *);
extern void overlay5_indexed_assignment_update(s16, s32);
extern void func_8002E688(char *, char *);
extern void func_8002E65C(char *, char *);
extern void func_8001EC20(s32, s32);
extern void func_800D8C00(Sub38 *, s32, Obj *);
extern void func_800D63B4(Obj *);
extern void overlay5_runtime_resource_rebuild(Rebuild *);
extern void func_800DF72C(void);
extern void overlay5_runtime_stack_advance(void);

void func_800D872C(Obj *arg0, s32 arg1, s32 arg2) {
    Rebuild rebuild;
    Table table;
    s32 first;
    s32 index;
    s32 last;
    s16 id;
    u8 *record;
    char *text;
    char *label;
    s32 owner;

    overlay5_record_extents_get(arg0->unk24->unkC, &first, &index, &last);
    if (index != D_800E6C38) {
        overlay5_data_record_copy_verified(&D_80002234, &table, 0);
        id = table.ids[index];
        if (id & 0x8000) {
            func_8001F754(0);
            D_800E7A90[0] = 0;
            arg0->unk78 = &D_8006BFA0;
            arg0->unkA0 = &D_800C2EE0;
        } else {
            record = func_8003AA28(id);
            D_800E7A90[0] = (record[0x24] << 8) | record[0x25];
            func_8001F25C(0, table.colors[index], 0);
            func_8001F2B4(0, record);
            arg0->unk78 = D_8007A3B8;
            func_800167FC(record[0xD], D_8007A3B8);
            arg0->unkA0 = record;
        }
        overlay5_indexed_assignment_update(D_800E7A90[0], 0);
        label = D_8007A3BC;
        arg0->unk7C = D_8006E9FC[index];
        arg0->unk80 = label;
        func_800167FC(table.labels[index], label);
        if ((u32)index < 9) {
            func_8002E688(label, D_8000223C);
        }
        text = D_8007A3D0;
        func_8002E65C(text, table.names[index]);
        owner = arg0->unk8;
        arg0->unkF8 = text;
        func_8001EC20(owner, 1);
        func_8001EC20(owner, 2);
        func_8001EC20(owner, 3);
        func_8001EC20(owner, 0xB);
        func_8001EC20(owner, 0x21);
        D_800E6C38 = index;
    }
    switch ((s16)arg2) {
    case 13:
        func_800D8C00(arg0->unk38, 0, arg0);
        arg0->unk38->unk14 |= 1;
        break;
    case 12:
        func_800D63B4(arg0);
        rebuild.object = arg0->unk8;
        rebuild.width = 0x140;
        rebuild.flags = 0;
        rebuild.height = 10;
        overlay5_runtime_resource_rebuild(&rebuild);
        break;
    case 8:
    case 28:
        func_800DF72C();
        overlay5_runtime_stack_advance();
        break;
    }
}
