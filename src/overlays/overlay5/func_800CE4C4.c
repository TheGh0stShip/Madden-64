typedef signed char s8; typedef unsigned char u8; typedef signed short s16; typedef unsigned short u16;
typedef signed int s32; typedef unsigned int u32;

typedef struct Spec {
    u16 kind;
    u8 pad02[2];
    void *resource;
    s32 flags;
    u8 pad0C[4];
    s16 value;
    u8 pad12[6];
} Spec;

typedef struct BuildDescriptor {
    u32 value;
    s16 mode;
    s16 field06;
    s16 field08;
    u8 pad0A[2];
    u32 count;
    u32 field10;
    u32 field14;
    void *source;
    u8 pad1C[8];
} BuildDescriptor;

typedef struct EntryList {
    s32 entries[200];
    s16 count;
} EntryList;

typedef struct Sprite {
    u8 pad00[0x20];
    s32 timer;
} Sprite;

typedef struct Menu {
    u8 pad00[8];
    u16 count;
    s16 sel;
    u8 pad0C;
    s8 unk0D;
    u8 pad0E[0x12];
    void *handler;
    u8 pad24[0xA];
    u8 flags;
    u8 pad2F[0x11];
    void *state;
    Sprite *cursor;
    Sprite *frame;
    void *owner;
    u8 pad50[8];
} Menu;

typedef struct Owner {
    u8 pad00[0x60];
    void **items;
} Owner;

extern s8 D_800892B0;
extern s32 D_8007A398;
extern s32 D_8007A39C;
extern u8 D_8007A38C;
extern u8 D_8007A388;
extern s16 D_8007A3B4;
extern s16 D_8007A3B0;
extern s16 D_8007A3A4;
extern s16 D_8007A3A0;
extern void *D_800879AC;
extern void *D_800854A0;
extern s32 D_80087780[];
typedef struct Resources {
    void *a;
    void *b;
    void *c;
    void *d;
} Resources;

extern Resources D_800892D8;
extern Resources D_800892E8;
extern void *D_80082DC8;
extern void *D_80084F14;

extern s8 D_80084FA8;
extern s32 D_80088090;
extern Sprite *D_8007A2D4;
extern Sprite *D_8007A2D0;
extern EntryList *D_8007A390;
extern EntryList *D_8007A394;
extern void *D_8008A050[];
extern void *D_8008A05C[];
extern Menu D_800E7580;
extern Menu D_800E75D8;
extern u8 D_800869D8[];
extern u8 D_800869F0[];

void *func_80032E00(s32, s32);
s32 *func_800DD634(void);
void func_80016FF4(void *);
void *func_8000D8DC(void *, BuildDescriptor *);
void func_80016FE4(void *);
void func_80017010(void *, s32);
void func_8001AEA8(s32 *);
s32 func_8000C8A0(s32);
Sprite *func_8000D740(s32, s32, Spec *);
EntryList *overlay5_flagged_operation_dispatch(s32, s32, s32, s8, s32);
u16 func_80022AD8(u16, u16);
void func_800CF578(s32, s32);
void func_800CE034(void);
void func_800CE27C(void);
void overlay5_resource_descriptor_build(u8 *, Menu *);
s32 func_800D3F4C(s16, s32 *, s16, s16);
void func_8003E460(void);
void func_800DB478(Menu *);

/*
 * func_800CE4C4: set up the team-select screen: allocate the ten logo sprites (ids
 * D_80001D30), reset the selection state, build the shared sprites into the display state,
 * fetch the team lists (overlay5_flagged_operation_dispatch) for the current conference and
 * division, and build the two scrolling menus (D_800E7580 teams, D_800E75D8 divisions) before
 * fading the cursor in.
 */
void func_800CE4C4(Owner *owner) {
    Spec spec;
    BuildDescriptor descriptor;
    s32 ids[10] = { 0x7C, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x7B, 0x73 };
    void **items;
    s32 *state;
    u32 i;
    void *resource;

    items = func_80032E00(0, 0x28);
    owner->items = items;
    state = func_800DD634();
    if (D_800892B0 == 0) {
        D_8007A398 = 0x440002;
        D_8007A39C = 0x1A;
        D_8007A38C = 6;
    } else {
        D_8007A398 = 0x440002;
        D_8007A39C = 0x1B;
        D_8007A38C = 5;
    }
    func_80016FF4(D_800879AC);
    func_80016FF4(D_800854A0);
    D_8007A388 = 0;
    D_8007A3B4 = 0;
    D_8007A3B0 = 0;
    D_8007A3A4 = 0;
    D_8007A3A0 = 0;
    for (i = 0x11; i < 0x47; i++) {
        state[i] = 0;
    }
    state[0] = 0x47;
    for (i = 0; i < 0x40; i++) {
        D_80087780[i] = 0;
    }
    D_80087780[0] = 0x3F;
    descriptor.value = 0x71;
    descriptor.field06 = 0;
    descriptor.field08 = 0;
    descriptor.field10 = 0;
    descriptor.mode = 4;
    descriptor.count = 0;
    resource = func_8000D8DC(0, &descriptor);
    state[0x48] = (s32)resource;
    func_80016FE4(resource);
    descriptor.value = 0x72;
    resource = func_8000D8DC(0, &descriptor);
    state[0x49] = (s32)resource;
    func_80016FE4(resource);
    state[5] = (s32)D_800892D8.a;
    state[6] = (s32)D_800892D8.b;
    state[7] = (s32)D_800892D8.c;
    state[8] = (s32)D_800892D8.d;
    state[9] = (s32)D_800892E8.a;
    state[10] = (s32)D_800892E8.b;
    state[11] = (s32)D_800892E8.c;
    state[12] = (s32)D_800892E8.d;
    descriptor.value = 0x48;
    descriptor.mode = 8;
    resource = func_8000D8DC(0, &descriptor);
    state[0x12] = (s32)resource;
    func_80016FE4(resource);
    func_80017010(D_80082DC8, 4);
    func_80017010(D_80084F14, 4);
    state[0x11] = ((s32 *)&D_80082DC8)[D_80084FA8 * 0x853];
    func_8001AEA8(state);
    spec.kind = 0x498;
    spec.value = 5;
    spec.resource = 0;
    spec.flags = 0;
    D_8007A2D4 = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    D_8007A2D4->timer = 0xFA;
    spec.kind = 0x490;
    spec.value = 6;
    spec.resource = D_80087780;
    spec.flags = 0;
    D_8007A2D0 = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    D_8007A2D0->timer = 0xFA;
    D_8007A390 = overlay5_flagged_operation_dispatch(D_8007A398, 0x37, 0, D_80084FA8, D_8007A39C);
    D_8007A394 = overlay5_flagged_operation_dispatch(
        0x640002, 0x37, 0, D_80084FA8, func_80022AD8(D_80084FA8, D_8007A390->entries[D_8007A3A0]) & 0x3F);
    func_800CF578(D_8007A390->entries[D_8007A3A0], D_8007A394->entries[D_8007A3A4]);
    descriptor.source = 0;
    descriptor.field06 = 0;
    descriptor.field08 = 0;
    descriptor.mode = 4;
    descriptor.field10 = 0;
    descriptor.count = 0;
    for (i = 0; i < 10; i++) {
        descriptor.value = ids[i];
        resource = func_8000D8DC(0, &descriptor);
        items[i] = resource;
        func_80016FE4(resource);
    }
    D_8008A050[0] = func_800CE034;
    D_800E7580.handler = D_8008A050;
    D_800E7580.sel = 0;
    D_800E7580.count = D_8007A390->count;
    D_800E7580.cursor = D_8007A2D0;
    D_800E7580.state = state;
    D_800E7580.flags &= ~1;
    D_800E7580.owner = owner;
    overlay5_resource_descriptor_build(D_800869D8, &D_800E7580);
    D_8008A05C[0] = func_800CE27C;
    D_800E75D8.handler = D_8008A05C;
    D_800E75D8.sel = 0;
    D_800E75D8.unk0D = 0;
    D_800E75D8.frame = D_8007A2D4;
    D_800E75D8.count = D_8007A394->count;
    D_800E75D8.cursor = D_8007A2D0;
    D_800E75D8.flags |= 1;
    D_800E75D8.state = state;
    D_800E75D8.owner = owner;
    overlay5_resource_descriptor_build(D_800869F0, &D_800E75D8);
    while (D_8007A2D0->timer > 0) {
        func_800D3F4C(6, &D_8007A2D0->timer, 0, 1);
        func_8003E460();
    }
    D_8007A388 = 1;
    D_8007A2D0->timer = 0;
    func_800DB478(&D_800E75D8);
}
