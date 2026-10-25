#include "types.h"

typedef struct IntrusiveNode {
    struct IntrusiveNode* previous;
    struct IntrusiveNode* next;
} IntrusiveNode;

typedef struct NodeList {
    u8 pad[8];
    IntrusiveNode* first;
    IntrusiveNode* last;
} NodeList;

void func_8000D874(NodeList* list, IntrusiveNode* node) {
    if (list->first == node) {
        list->first = node->next;
        if (list->first != 0) {
            list->first->previous = 0;
        } else {
            list->last = 0;
        }
    } else if (list->last == node) {
        list->last = node->previous;
        list->last->next = 0;
    } else {
        node->previous->next = node->next;
        node->next->previous = node->previous;
    }
    node->previous = 0;
    node->next = 0;
}
