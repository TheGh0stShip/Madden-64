#include "types.h"

typedef struct Overlay5ManagedNode {
    struct Overlay5ManagedNode* previous;
    struct Overlay5ManagedNode* next;
    u32 field8;
    struct Overlay5ManagedNode* children;
} Overlay5ManagedNode;

typedef struct Overlay5ManagedList {
    Overlay5ManagedNode* head;
    u8 pad4[4];
    u8 active;
} Overlay5ManagedList;

extern Overlay5ManagedList* D_80072468;
extern void func_8002FF70(void* value);
extern s16 func_800E0F30(Overlay5ManagedNode* node);

void func_800E0E84(void* value) {
    void* saved_value = value;
    Overlay5ManagedList* list = D_80072468;
    Overlay5ManagedNode* node;

    if (list->head == 0) {
        list->active = 0;
        if (saved_value != 0) {
            func_8002FF70(saved_value);
        }
        return;
    }

    node = list->head;
    while (node != 0) {
        Overlay5ManagedNode* next = node->next;

        if (func_800E0F30(node) == 1) {
            Overlay5ManagedNode* child = node->children;

            while (child != 0) {
                Overlay5ManagedNode* child_next = child->next;
                func_800E0F30(child);
                child = child_next;
            }
        }
        node = next;
    }
}
