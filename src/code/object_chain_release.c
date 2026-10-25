#include "types.h"

typedef struct ObjectChainNode ObjectChainNode;
struct ObjectChainNode {
    ObjectChainNode *previous;
    ObjectChainNode *next;
    ObjectChainNode *child;
};

extern ObjectChainNode *D_80064BA8;
extern void *D_800782F0;
extern void func_8000D998(ObjectChainNode *parent, ObjectChainNode *child);
extern void func_800332C8(void *pool, void *value);

void object_chain_release(ObjectChainNode *node)
{
    register ObjectChainNode *saved_node __asm__("$16") = node;
    ObjectChainNode *next;

    while (saved_node->child != 0) {
        func_8000D998(saved_node, saved_node->child);
    }
    if (saved_node == D_80064BA8) {
        next = saved_node->next;
        D_80064BA8 = next;
        if (next != 0) {
            next->previous = 0;
        }
    } else if (saved_node->next != 0) {
        if (saved_node->previous != 0) {
            saved_node->previous->next = saved_node->next;
        }
        if (saved_node->next != 0) {
            saved_node->next->previous = saved_node->previous;
        }
    } else {
        saved_node->previous->next = 0;
    }
    func_800332C8(D_800782F0, saved_node);
}
