#include "types.h"

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
    s16 x;
    s16 y;
    u8 pad0A[2];
    u32 count;
    u32 field10;
    void *parent;
    void *source;
    u8 pad1C[8];
} BuildDescriptor;

typedef struct Pair {
    s16 first;
    s16 second;
} Pair;

typedef struct Sprite {
    u8 pad00[0x1C];
    s32 x;
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
    Sprite *selector;
    Sprite *frame;
    void *owner;
    u8 pad50[8];
} Menu;

typedef struct Owner {
    u8 pad00[0x60];
    void **items;
} Owner;

typedef struct Resources {
    void *a;
    void *b;
    void *c;
    void *d;
} Resources;

typedef struct Team {
    u8 pad00[0x18];
    void *roster;
    u8 pad1C[0xC];
} Team;

extern s16 D_8007A310;
extern s16 D_8007A30C;
extern u16 D_8007A308;
extern s8 D_8007A384;
extern s8 D_8008B358;
extern s8 D_800892B0;
extern void *D_800879AC;
extern void *D_800854A0;
extern void *D_80082DC8;
extern void *D_80084F14;
extern s8 D_80084FA8;
extern void *D_800721A4;
extern u8 D_8006CD38[];
extern u8 D_8006D0F0[];
extern void *D_80087780[];
extern Team *D_80088094;
extern s32 D_80088090;
extern void *D_800E6B78[];
extern Resources D_800892D8;
extern Sprite *D_8007A2D0;
extern Sprite *D_8007A2D4;
extern Sprite *D_8007A2D8;
extern Sprite *D_8007A2DC[];
extern void *D_8008A060[];
extern void *D_80088708[];
extern Menu D_800E7508;
extern Menu D_800E74AC;
extern u8 D_80086A08[];
extern u8 D_800878F0[];

void *func_80032E00(s32, s32);
s32 *func_800DD634(void);
void func_80016FF4(void *);
void *func_8000D8DC(void *, BuildDescriptor *);
void func_80016FE4(void *);
void func_80017000(void *, s16, s16);
void func_80017010(void *, s32);
s16 *func_80017C7C(void *);
void func_8001ECAC(Sprite *, s32, s32);
s32 func_8000C8A0(s32);
Sprite *func_8000D740(s32, s32, void *);
void func_800221E8(u16, u16, Pair *);
u16 func_80022234(u16, u16);
void func_800CCDD8(void);
void func_800CCB94(void);
void func_800CDC4C(void);
void overlay5_resource_descriptor_build(u8 *, Menu *);
s32 func_800D3F4C(s16, s32 *, s16, s16);
void func_8003E460(void);

/*
 * func_800CD03C: set up the roster screen: create the eleven row sprites for the current team
 * at the positions func_800221E8 gives, the header/selector sprites, the ten logo sprites, and
 * the two menus (D_800E7508, D_800E74AC), then slide everything in while the selector timer runs.
 */
void func_800CD03C(Owner *owner) {
    Spec spec;
    BuildDescriptor descriptor;
    Pair pair;
    s32 ids[10] = { 0x7C, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x7B, 0x73 };
    s32 y;
    void **items;
    s32 *state;
    u32 i;
    Sprite *sprite;
    s16 *pos;

    D_8007A310 = 0;
    func_80016FF4(D_800879AC);
    func_80016FF4(D_800854A0);
    state = func_800DD634();
    func_80017010(D_80082DC8, 4);
    func_80017010(D_80084F14, 4);
    D_800721A4 = D_8006CD38;
    items = func_80032E00(0, 0x28);
    owner->items = items;
    state[0x11] = ((s32 *)&D_80082DC8)[D_80084FA8 * 0x853];
    if (D_800892B0 == 0) {
        descriptor.value = 0x6F;
        D_8007A384 = -10;
    } else {
        descriptor.value = 0x70;
        D_8007A384 = 10;
    }
    if (D_8008B358 == 9) {
        D_8007A384 = 10;
    }
    func_800221E8(D_8008B358, 0, &pair);
    descriptor.mode = 4;
    descriptor.field10 = 0;
    descriptor.count = 0;
    descriptor.x = pair.first * 2 + 0x14;
    descriptor.y = D_8007A384 + pair.second * 3 + 0x112;
    D_8007A2DC[0] = sprite = func_8000D740(func_8000C8A0(D_80088090), 0, &descriptor);
    func_80016FE4(sprite);
    descriptor.count = 0x20;
    descriptor.parent = D_8007A2DC[0];
    for (i = 1; i < 11; i++) {
        func_800221E8(D_8008B358, i, &pair);
        D_8007A2DC[i] = func_8000D740(func_8000C8A0(D_80088090), 0, &descriptor);
        func_80017000(D_8007A2DC[i], pair.first * 2 + 0x14, D_8007A384 + pair.second * 3 + 0x112);
        func_80016FE4(D_8007A2DC[i]);
    }
    state[5] = (s32)D_800892D8.a;
    state[6] = (s32)D_800892D8.b;
    state[7] = (s32)D_800892D8.c;
    state[8] = (s32)D_800892D8.d;
    D_8007A30C = 0;
    for (i = 1; i < 0x2D; i++) {
        D_80087780[i] = 0;
    }
    D_80087780[0] = (void *)0x25;
    if (D_8008B358 != 5) {
        D_80087780[0x23] = D_80088094[D_8008B358].roster;
    } else {
        D_80087780[0x23] = D_8006D0F0;
    }
    D_80087780[0x24] = D_800E6B78[func_80022234(D_8008B358, 0)];
    spec.kind = 0x480;
    spec.value = 5;
    spec.resource = 0;
    spec.flags = 0;
    D_8007A2D4 = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    spec.kind = 0x488;
    spec.value = 4;
    spec.resource = D_80087780;
    D_8007A2D8 = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    func_800221E8(D_8008B358, 0, &pair);
    D_8007A2D8->x = pair.first * 2 - 3;
    D_8007A2D8->timer = D_8007A384 + pair.second * 3 + 0x108;
    func_8001ECAC(D_8007A2D8, 0x24, 6);
    spec.kind = 0x478;
    spec.value = 6;
    spec.resource = D_80087780;
    spec.flags = 0;
    D_8007A2D0 = func_8000D740(func_8000C8A0(D_80088090), 1, &spec);
    func_800CDC4C();
    descriptor.source = 0;
    descriptor.x = 0;
    descriptor.y = 0;
    descriptor.mode = 4;
    descriptor.field10 = 0;
    descriptor.count = 0;
    for (i = 0; i < 10; i++) {
        descriptor.value = ids[i];
        items[i] = func_8000D8DC(0, &descriptor);
        func_80016FE4(items[i]);
    }
    D_8008A060[0] = func_800CCDD8;
    D_800E7508.handler = D_8008A060;
    D_800E7508.owner = owner;
    D_800E7508.state = state;
    D_800E7508.selector = D_8007A2D0;
    D_800E7508.flags &= ~1;
    overlay5_resource_descriptor_build(D_80086A08, &D_800E7508);
    D_80088708[0] = func_800CCB94;
    D_800E74AC.handler = D_80088708;
    D_800E74AC.state = state;
    D_800E74AC.owner = owner;
    D_800E74AC.frame = D_8007A2D4;
    D_800E74AC.count = D_8007A308;
    D_800E74AC.selector = D_8007A2D0;
    D_800E74AC.flags |= 1;
    overlay5_resource_descriptor_build(D_800878F0, &D_800E74AC);
    D_8007A2D0->timer = 0xF4;
    D_8007A2D4->timer = 0xF4;
    while (D_8007A2D0->timer > 0) {
        func_800D3F4C(6, &D_8007A2D0->timer, 0, 1);
        func_800221E8(D_8008B358, 0, &pair);
        func_800D3F4C(6, &D_8007A2D8->timer, pair.second * 3 + (s16)(D_8007A384 + 0x14), 1);
        for (i = 0; i < 11; i++) {
            func_800221E8(D_8008B358, i, &pair);
            pos = func_80017C7C(D_8007A2DC[i]);
            y = pos[1];
            func_800D3F4C(6, &y, pair.second * 3 + (s16)(D_8007A384 + 0x1E), 1);
            pos[1] = y;
            func_80017000(D_8007A2DC[i], pos[0], y);
        }
        func_8003E460();
    }
    D_8007A2D0->timer = 0;
}
