#include "types.h"

typedef struct Overlay5StatusNode {
    u8 pad00[4];
    struct Overlay5StatusNode *next;
    s16 state;
    u8 pad0A[6];
    u8 kind;
} Overlay5StatusNode;

typedef struct Overlay5StatusOwner {
    u8 pad00[8];
    Overlay5StatusNode *head;
    Overlay5StatusNode *current;
} Overlay5StatusOwner;

s32 overlay5_linked_resource_status_get(
    Overlay5StatusOwner *owner,
    u32 target
) {
    Overlay5StatusNode *node;
    u32 index;

    node = owner->head;
    index = 0;
    target = (u16)target;
    do {
        if (node->kind == target) {
            if (node->state == 0) {
                return 5;
            }
            return node == owner->current ? 6 : 0;
        }
        node = node->next;
        index++;
    } while (target >= (u8)index);
    return 0;
}
