#include "types.h"

typedef struct Actor Actor;
struct Actor {
    Actor *next;
    u8 pad04[0x28 - 0x4];
    u16 flags;
    u8 pad2A[0x60 - 0x2A];
    u16 (*poll)(Actor *actor);
};

extern void func_800E48A4(Actor *actor);
extern void func_800E47C4(Actor *actor);

void func_800E31B4(Actor *actor) {
    while (actor != 0) {
        if (!(actor->flags & 0x10) && actor->poll(actor) == 1 && !(actor->flags & 2)) {
            func_800E48A4(actor);
            func_800E47C4(actor);
        }
        actor = actor->next;
    }
}
