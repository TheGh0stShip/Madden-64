#include "types.h"

typedef struct NodeE0D30 {
    struct NodeE0D30* previous;
    struct NodeE0D30* next;
    struct NodeE0D30* parent;
    struct NodeE0D30* child;
} NodeE0D30;

typedef struct StateE0D30 {
    NodeE0D30* head;
    void* allocator;
} StateE0D30;

extern StateE0D30* D_80072468;
extern void func_800332C8(void* allocator, NodeE0D30* node);

void func_800E0D30(NodeE0D30* node) {
    NodeE0D30* child;
    NodeE0D30* next;

    if (node->previous != 0) {
        node->previous->next = node->next;
    } else if (node->parent != 0) {
        node->parent->child = node->next;
    } else {
        D_80072468->head = node->next;
    }
    if (node->next != 0) {
        node->next->previous = node->previous;
    }
    child = node->child;
    while (child != 0) {
        next = child->next;
        child->previous = 0;
        child->next = 0;
        child->child = 0;
        child->parent = 0;
        func_800332C8(D_80072468->allocator, child);
        child = next;
    }
    node->previous = 0;
    node->next = 0;
    node->child = 0;
    node->parent = 0;
    func_800332C8(D_80072468->allocator, node);
}
