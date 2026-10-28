#include "types.h"

typedef struct ResourceNode ResourceNode;
struct ResourceNode {
    ResourceNode *previous;
    ResourceNode *next;
    void *payload;
    u8 pad[0x48];
    u16 type;
};

typedef struct ResourceOwner {
    u8 pad[8];
    ResourceNode *head;
    ResourceNode *tail;
} ResourceOwner;

typedef struct ResourceTypeOps {
    u8 pad[0x14];
    void (*release)(ResourceNode *);
} ResourceTypeOps;

extern ResourceOwner *D_8008931C;
extern ResourceTypeOps *D_800782FC;
extern void **D_800782F8;
extern void *D_800782F4;
extern void func_8000BE80(ResourceOwner *);
extern void func_800332C8(void *, void *);

void node_resource_attach(ResourceOwner *owner, ResourceNode *node)
{
    ResourceNode *link;
    u32 type;
    ResourceTypeOps *ops;

    if (owner != D_8008931C) {
        func_8000BE80(owner);
    }
    type = node->type;
    ops = D_800782FC;
    ops += type;
    ops->release(node);
    func_800332C8(D_800782F8[node->type], node->payload);
    node->payload = 0;

    if (owner->head == node) {
        link = node->next;
        owner->head = link;
        if (link != 0) {
            link->previous = 0;
        } else {
            owner->tail = 0;
        }
    } else if (owner->tail == node) {
        link = node->previous;
        owner->tail = link;
        link->next = 0;
    } else {
        node->previous->next = node->next;
        node->next->previous = node->previous;
    }
    func_800332C8(D_800782F4, node);
}
