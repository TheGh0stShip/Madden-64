#include "types.h"

typedef struct {
    u8 active;
    u8 b1;
    u8 b2;
    u8 b3;
} SlotEntry;

typedef struct {
    u8 pad00[0x28];
    u16 flags;
    u8 pad2A[0x30 - 0x2A];
    s16 delay;
    u8 pad32[0x64 - 0x32];
    u8 kind;
    u8 pad65[0x8C - 0x65];
    s32 timer;
} Actor;

extern s32 D_80080C10;
extern s16 D_800876DC;
extern s16 D_80087AAC;
extern s32 D_80072C58[];
extern Actor *D_8008A058;
extern s32 func_80093F0C(void);
extern s16 func_8003F16C(Actor *actor);
extern u16 func_80034D30(s32 id, s32 arg1, s32 arg2);
extern void func_800E1A84(Actor *actor, SlotEntry *entry);
extern void func_800E1BAC(Actor *actor, SlotEntry *entry);

s32 func_800E3BA8(Actor *actor, u8 index) {
    SlotEntry entry;
    s32 started;

    started = 0;
    entry.active = 0x33;
    entry.b1 = index;
    entry.b2 = 0;
    entry.b3 = 0;
    if (func_80093F0C() != 0) {
        if (!(D_80080C10 & 0x200) || (D_800876DC == 1 || D_800876DC == 3) || D_80087AAC >= 0x79) {
            if (func_8003F16C(actor) == 0 && func_80034D30(D_80072C58[index], 2, 0) != 0) {
                started = 1;
            }
        }
    }
    if (started != 0) {
        if (!(actor->flags & 0x10)) {
            func_800E1A84(actor, &entry);
        } else {
            func_800E1BAC(actor, &entry);
        }
        if (index < 12 && D_8008A058 != 0) {
            if (D_8008A058->kind == 0x1A) {
                D_8008A058->delay = 0x50;
            }
            if (D_8008A058->kind == 6) {
                D_8008A058->timer = 0xB4;
            }
        }
    }
    return started;
}
