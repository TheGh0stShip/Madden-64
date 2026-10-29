#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} ActorState;

typedef struct Actor Actor;
struct Actor {
    Actor *next;
    u8 pad04[0x24 - 0x4];
    ActorState *state;
    u16 flags;
};

extern s32 D_80082DBC;
extern Actor *D_800855F8;
extern s32 D_80084F08;
extern u8 D_80087A82;
extern void func_80037594(s32 slot, s32 value);
extern void func_800CDA80(void);
extern void func_800E47C4(Actor *actor);
extern void func_800D51B0(void);
extern void func_800D521C(void);

void func_800E3960(void) {
    Actor *actor;
    u16 flags;

    actor = D_800855F8;
    func_80037594(0, D_80082DBC);
    func_80037594(1, D_80084F08);
    func_800CDA80();
    while (actor != 0) {
        actor->state->flags |= 0x200;
        flags = actor->flags;
        if (flags & 8) {
            actor->flags = flags & 0xFFFE;
        }
        if (!(actor->flags & 0x10)) {
            func_800E47C4(actor);
        }
        actor = actor->next;
    }
    func_800D51B0();
    func_800D521C();
    D_80087A82 = 0;
}
