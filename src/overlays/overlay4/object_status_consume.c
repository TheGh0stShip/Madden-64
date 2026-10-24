#include "types.h"

typedef struct ObjectStatusLink {
    u8 pad00[0x14];
    u32 flags;
} ObjectStatusLink;

typedef struct ObjectStatus {
    u8 pad00[0x24];
    ObjectStatusLink *link;
    u16 flags;
    u8 pad2A[0xA];
    s16 state;
    s16 timer;
} ObjectStatus;

s32 func_800E5048(ObjectStatus *object) {
    if (object->link->flags & 0x40000) {
        object->state = 0x25;
        object->timer = 8;
        object->link->flags &= ~0x40000;
    }

    if (object->link->flags & 0x20000) {
        return 0;
    }

    object->state = 0x25;
    object->timer = 8;
    object->link->flags &= ~0x10000;
    object->flags &= ~0x10;
    return 1;
}
