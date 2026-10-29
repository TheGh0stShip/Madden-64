#include "types.h"

typedef struct Overlay5ChildNode {
    struct Overlay5ChildNode* previous;
    struct Overlay5ChildNode* next;
    struct Overlay5ChildNode* parent;
    struct Overlay5ChildNode* children;
    void* source;
    u16 value;
    u8 type;
    u8 flags;
} Overlay5ChildNode;

typedef struct Overlay5ChildList {
    Overlay5ChildNode* head;
    void* allocator;
} Overlay5ChildList;

typedef struct Overlay5ChildInput {
    void* source;
    u16 value;
    u8 type;
    u8 flags;
} Overlay5ChildInput;

extern Overlay5ChildList* D_80072468;
extern Overlay5ChildNode* func_80033298(void* allocator);

Overlay5ChildNode* func_800E0C60(Overlay5ChildInput* input,
                                 Overlay5ChildNode* parent) {
    Overlay5ChildNode* node;
    Overlay5ChildNode* current;

    node = func_80033298(D_80072468->allocator);
    node->previous = 0;
    node->next = 0;
    node->children = 0;
    node->source = input->source;
    node->value = input->value;
    node->type = input->type;
    node->flags = input->flags;
    node->parent = parent;

    if (parent->children != 0) {
        current = parent->children;
        if (current->next != 0) {
            do {
                current = current->next;
            } while (current->next != 0);
        }
        node->previous = current;
        current->next = node;
    } else {
        parent->children = node;
    }
    return node;
}
