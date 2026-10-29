#include "types.h"

typedef struct NodeDFB98 {
    struct NodeDFB98* previous;
    struct NodeDFB98* next;
    s16 active;
    u8 padA[2];
    void* value;
    u8 index;
} NodeDFB98;

typedef struct OwnerDFB98 {
    u8 pad0[0x14];
    void* value;
} OwnerDFB98;

typedef struct ListDFB98 {
    void* allocator;
    OwnerDFB98* owner;
    NodeDFB98* head;
    NodeDFB98* current;
    u8 pad10[0xC];
    u8 control[1];
} ListDFB98;

typedef struct ObjectDFB98 {
    u8 pad0[0xC];
    ListDFB98* list;
} ObjectDFB98;

extern NodeDFB98* func_80033298(void* allocator);
extern void func_800DB0AC(void* control, u8 index, s32 value);

NodeDFB98* func_800DFB98(ObjectDFB98* object, void* value) {
    ListDFB98* list;
    NodeDFB98* node;
    NodeDFB98* current;

    list = object->list;
    node = func_80033298(list->allocator);
    node->active = 1;
    current = list->head;
    node->previous = 0;
    node->next = 0;
    node->value = value;
    if (current == 0) {
        list->head = node;
        node->index = 0;
    } else {
        while (current->next != 0) {
            current = current->next;
        }
        node->index = current->index + 1;
        current->next = node;
        node->previous = current;
    }
    if (list->owner->value == value) {
        list->current = node;
    }
    if (list->current != 0) {
        func_800DB0AC(list->control, list->current->index, 0);
    }
    return node;
}
