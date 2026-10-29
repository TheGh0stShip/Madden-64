#include "types.h"

typedef struct Overlay5ListNode {
    u8 pad00[4];
    struct Overlay5ListNode *next;
} Overlay5ListNode;

typedef struct Overlay5ListState {
    Overlay5ListNode *head;
} Overlay5ListState;

extern Overlay5ListState *D_80072468;

void func_800E0D30(Overlay5ListNode *node);

void overlay5_runtime_list_clear(void) {
    Overlay5ListNode *node;
    Overlay5ListNode *next;

    node = D_80072468->head;
    while (node != 0) {
        next = node->next;
        func_800E0D30(node);
        node = next;
    }
}
