#include "types.h"

typedef struct {
    u8 active;
    u8 b1;
    u8 b2;
    u8 b3;
} SlotEntry;

typedef struct {
    u8 kind;
    u8 value;
    u8 flags;
    u8 pad03[0x8 - 0x3];
} PlayInfo;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} LinkedState;

typedef struct Actor Actor;
struct Actor {
    Actor *next;
    u8 pad04[0x1E - 0x4];
    u8 team;
    u8 position;
    u8 pad20[0x24 - 0x20];
    LinkedState *state;
    u16 flags;
};

extern Actor *D_800855F8;
extern u8 D_800884A4;
extern s16 D_800886E0;
extern u8 D_800876B8;
extern u8 D_800884A8;
extern u8 D_800857D4;
extern s16 D_80088AE4;
extern s32 D_80080C10[];
extern s16 D_80089320;
extern s8 D_80086DDC[];
extern void func_80038728(u16 team, u8 position, PlayInfo *info);
extern void func_800E1C98(Actor *actor);
extern void func_800E1B00(Actor *actor, SlotEntry *entry);
extern void func_800E47C4(Actor *actor);

void func_800E3798(s16 team) {
    Actor *actor;
    SlotEntry entry;
    PlayInfo info;

    actor = D_800855F8;
    D_800884A4 = 2;
    D_800876B8 = 0;
    D_800884A8 = 1;
    if (team == D_800886E0) {
        D_800857D4 = 1;
    }
    while (actor != 0) {
        if (actor->team == team) {
            if (actor->team == D_80088AE4) {
                actor->flags |= 8;
                if ((D_80080C10[0] & 0x900) == 0x800 && actor->position >= 6) {
                    entry.active = 0x27;
                    goto send;
                }
            } else {
                actor->flags &= 0xFFF7;
                if (D_80089320 != -1 && D_80086DDC[D_800886E0] == 1) {
                    func_80038728(D_800886E0, actor->position, &info);
                    entry.b2 = 0xFF;
                    if (info.kind == 0x19) {
                        if (info.flags & 4) {
                            entry.b1 = 0;
                        } else {
                            entry.b1 = 0xFF;
                        }
                        if (info.flags & 8) {
                            D_800857D4 = 0;
                            entry.b2 = info.value;
                            func_800E1C98(actor);
                        }
                    } else {
                        entry.b1 = 0xFF;
                    }
                    entry.active = 0x1E;
send:
                    func_800E1B00(actor, &entry);
                }
            }
            actor->state->flags &= 0xFFFCFFFF;
            actor->flags &= 0xFFCE;
            func_800E47C4(actor);
        }
        actor = actor->next;
    }
}
