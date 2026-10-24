#include "types.h"

typedef struct LinkNode {
    u8 pad0[0x14];
    struct LinkNode* previous;
    struct LinkNode* next;
} LinkNode;

extern LinkNode* D_8007A40C[];
extern LinkNode* D_8007A410[];

void func_80033768(LinkNode* node, s16 list) {
    LinkNode* next = node->next;
    LinkNode* previous = node->previous;

    if (next != (LinkNode*)-1) {
        next->previous = previous;
    } else {
        D_8007A40C[list] = previous;
    }
    if (previous != (LinkNode*)-1) {
        previous->next = next;
    } else {
        D_8007A410[list] = next;
    }
    node->next = (LinkNode*)-1;
    node->previous = (LinkNode*)-1;
}
