#include "types.h"

typedef struct Actor Actor;
struct Actor {
    Actor *next;
};

extern void func_800E1C98(Actor *actor);
extern void func_800E47C4(Actor *actor);

void func_800E3170(Actor *actor) {
    while (actor != 0) {
        func_800E1C98(actor);
        func_800E47C4(actor);
        actor = actor->next;
    }
}
