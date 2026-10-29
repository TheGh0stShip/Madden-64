#include "types.h"

typedef struct Actor Actor;
struct Actor {
    u8 pad00[0x21];
    u8 mode;
    u8 pad22[0x28 - 0x22];
    u16 flags;
    u8 pad2A[0x3E - 0x2A];
    s16 target;
    u8 pad40[0x54 - 0x40];
    u16 (*react)(Actor *actor);
    u16 (*engage)(Actor *actor);
};

extern void func_800BB9F0(Actor *actor);
extern void func_800E48A4(Actor *actor);
extern void func_800E47C4(Actor *actor);

void func_800E323C(Actor *actor) {
    actor->flags &= 0xFFFD;
    actor->target = -1;
    if ((actor->mode & 0xC0) == 0x40) {
        if (!(actor->flags & 1)) {
            func_800BB9F0(actor);
            if (!(actor->flags & 1)) {
                goto react;
            }
        }
        if (actor->engage(actor) == 1 && !(actor->flags & 2)) {
            func_800E48A4(actor);
            func_800E47C4(actor);
        }
    }
react:
    if (actor->react(actor) == 1 && !(actor->flags & 2)) {
        func_800E48A4(actor);
        func_800E47C4(actor);
    }
}
