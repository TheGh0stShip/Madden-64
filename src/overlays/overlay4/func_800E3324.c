#include "types.h"

typedef struct Actor Actor;

struct Actor {
    u8 pad00[0x5C];
    u16 (*ready)(Actor *actor);
};

extern Actor *D_800876CC;

void func_800E4880(Actor *actor, s32 arg);
void func_800E47C4(Actor *actor);
void func_800E4904(Actor *actor, s32 arg);

void func_800E3324(Actor *actor, s32 arg) {
    if (actor == D_800876CC) {
        func_800E4880(actor, arg);
        func_800E47C4(actor);
    } else if (actor->ready(actor) == 1) {
        func_800E4880(actor, arg);
        func_800E47C4(actor);
    } else {
        func_800E4904(actor, arg);
    }
}
