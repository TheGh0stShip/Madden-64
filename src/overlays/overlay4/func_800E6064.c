#include "types.h"

typedef struct Actor Actor;

typedef struct {
    u16 (*enter)(Actor *actor);
    void *update;
    void *render;
    void *ready;
    void *poll;
} ActorHandlers;

struct Actor {
    u8 pad00[0x28];
    u16 flags;
    u8 pad2A[0x50 - 0x2A];
    ActorHandlers handlers;
    u8 kind;
};

extern ActorHandlers D_80072780[];
extern void func_800E48A4(Actor *actor);
extern void func_800E47C4(Actor *actor);

void func_800E6064(Actor *actor) {
    actor->flags |= 2;
    actor->handlers = D_80072780[actor->kind];
    if (actor->handlers.enter(actor) == 1) {
        func_800E48A4(actor);
        func_800E47C4(actor);
    }
}
