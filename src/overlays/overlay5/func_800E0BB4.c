#include "types.h"

typedef struct Overlay5ListNode {
    struct Overlay5ListNode* previous;
    struct Overlay5ListNode* next;
    u32 field8;
    u32 fieldC;
    void* source;
    u16 value;
    u8 type;
    u8 flags;
} Overlay5ListNode;

typedef struct Overlay5List {
    Overlay5ListNode* head;
    void* allocator;
} Overlay5List;

typedef struct Overlay5ListInput {
    void* source;
    u16 value;
    u8 type;
    u8 flags;
} Overlay5ListInput;

extern Overlay5List* D_80072468;
extern Overlay5ListNode* func_80033298(void* allocator);

Overlay5ListNode* func_800E0BB4(Overlay5ListInput* input) {
    Overlay5List* list;
    Overlay5ListNode* node;
    Overlay5ListNode* current;

    node = func_80033298(D_80072468->allocator);
    node->previous = 0;
    node->next = 0;
    node->fieldC = 0;
    node->field8 = 0;
    node->source = input->source;
    node->value = input->value;
    node->type = input->type;
    node->flags = input->flags;

    list = D_80072468;
    if (list->head != 0) {
        current = list->head;
        if (current->next != 0) {
            do {
                current = current->next;
            } while (current->next != 0);
        }
        node->previous = current;
        current->next = node;
    } else {
        list->head = node;
    }
    return node;
}
