#include "types.h"

#ifndef NULL
#define NULL 0
#endif

typedef struct ListNode {
    struct ListNode *next;
    struct ListNode *prev;
} ListNode;

extern ListNode *D_800855F8;

/* Appends node to the end of the list headed by D_800855F8. */
void func_800C6A34(ListNode *node) {
    ListNode *tail;

    if (D_800855F8 == NULL) {
        node->prev = NULL;
        node->next = NULL;
        D_800855F8 = node;
    } else {
        for (tail = D_800855F8; tail->next != NULL; tail = tail->next) {
        }
        node->next = NULL;
        node->prev = tail;
        tail->next = node;
    }
}
