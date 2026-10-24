#include "types.h"

typedef struct ListNode {
    struct ListNode* previous;
    struct ListNode* next;
    u8 pad08[0x44];
    u32 value4C;
    u32 value50;
} ListNode;

typedef struct NodeList {
    u8 pad00[8];
    ListNode* head;
    ListNode* tail;
} NodeList;

void func_8000D834(NodeList* list, ListNode* node) {
    if (list->head != 0) {
        node->previous = 0;
        node->next = list->head;
        list->head->previous = node;
        list->head = node;
    } else {
        list->tail = node;
        list->head = node;
        node->next = 0;
        node->previous = 0;
    }
    node->value4C = 0;
    node->value50 = 0;
}
