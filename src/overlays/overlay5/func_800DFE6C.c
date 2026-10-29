#include "types.h"

typedef struct NodeDFE6C {
    struct NodeDFE6C* previous;
    struct NodeDFE6C* next;
    u8 pad8[4];
    void* value;
    u8 count;
} NodeDFE6C;

typedef struct ListDFE6C {
    void* allocator;
    u8 pad4[4];
    NodeDFE6C* head;
    NodeDFE6C* tail;
    NodeDFE6C* current;
} ListDFE6C;

typedef struct OwnerDFE6C {
    u8 pad0[0xC];
    ListDFE6C* list;
} OwnerDFE6C;

extern void func_800332C8(void* allocator, NodeDFE6C* node);

void func_800DFE6C(OwnerDFE6C* owner, void* value) {
    ListDFE6C* list;
    NodeDFE6C* node;
    NodeDFE6C* scan;

    list = owner->list;
    node = list->head;
    while (node != 0 && node->value != value) {
        node = node->next;
    }
    if (list->current == node) {
        list->current = 0;
    }
    if (list->tail == node) {
        if (node->previous != 0) {
            list->tail = node->previous;
        } else if (node->next != 0) {
            list->tail = node->next;
        }
    }
    scan = node->next;
    while (scan != 0) {
        scan->count--;
        scan = scan->next;
    }
    if (node->previous != 0) {
        node->previous->next = node->next;
    } else {
        list->head = node->next;
    }
    if (node->next != 0) {
        node->next->previous = node->previous;
    }
    node->previous = 0;
    node->next = 0;
    func_800332C8(list->allocator, node);
}
