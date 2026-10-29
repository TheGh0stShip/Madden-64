#include "types.h"

typedef struct Overlay5QueueNode {
    struct Overlay5QueueNode* previous;
    struct Overlay5QueueNode* next;
    u8 type;
} Overlay5QueueNode;

typedef struct Overlay5QueueCallbacks {
    void* field0;
    void (*remove)(Overlay5QueueNode* node);
    void (*activate)(Overlay5QueueNode* node, s32 value);
    void* fieldC;
} Overlay5QueueCallbacks;

typedef struct Overlay5Queue {
    Overlay5QueueCallbacks* callbacks;
    Overlay5QueueNode* current;
    Overlay5QueueNode* head;
} Overlay5Queue;

extern Overlay5Queue* D_80072460;
extern void func_80032F3C(s32 value, Overlay5QueueNode* node);

void func_800E078C(Overlay5QueueNode* node) {
    Overlay5Queue* queue;
    Overlay5QueueNode* next;

    queue = D_80072460;
    queue->callbacks[node->type].remove(node);

    if (node->previous != 0) {
        node->previous->next = node->next;
    } else {
        D_80072460->head = node->next;
    }
    if (node->next != 0) {
        node->next->previous = node->previous;
    }

    queue = D_80072460;
    if (node == queue->current) {
        next = queue->head;
        queue->current = next;
        if (next != 0) {
            queue->callbacks[next->type].activate(next, 10);
        }
    }

    node->next = 0;
    node->previous = 0;
    func_80032F3C(0, node);
}
