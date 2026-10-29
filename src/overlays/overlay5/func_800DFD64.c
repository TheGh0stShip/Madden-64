#include "types.h"

typedef struct NodeDFD64 {
    struct NodeDFD64* previous;
    struct NodeDFD64* next;
    s16 active;
    u8 padA[2];
    void* value;
    u8 index;
} NodeDFD64;

typedef struct OwnerDFD64 {
    u8 pad0[0x14];
    void* value;
} OwnerDFD64;

typedef struct ListDFD64 {
    void* allocator;
    OwnerDFD64* owner;
    NodeDFD64* head;
    NodeDFD64* current;
    u8 pad10[0xC];
    u8 control[1];
} ListDFD64;

typedef struct ObjectDFD64 {
    u8 pad0[0xC];
    ListDFD64* list;
} ObjectDFD64;

extern NodeDFD64* func_80033298(void* allocator);
extern void func_800DB0AC(void* control, u8 index, s32 value);

NodeDFD64* func_800DFD64(ObjectDFD64* object, void* value, void* before) {
    ListDFD64* list;
    NodeDFD64* node;
    NodeDFD64* current;

    list = object->list;
    node = func_80033298(list->allocator);
    node->active = 1;
    node->previous = 0;
    node->next = 0;
    node->value = value;
    current = list->head;
    while (current != 0) {
        if (current->value == before) {
            break;
        }
        current = current->next;
    }
    node->index = current->index;
    if (current->previous == 0) {
        goto new_head;
    }
    current->previous->next = node;
    node->next = current;
    node->previous = current->previous;
    current->previous = node;
    goto inserted;
new_head:
    list->head = node;
    node->next = current;
inserted:
    current = node->next;
    while (current != 0) {
        current->index++;
        current = current->next;
    }
    if (list->owner->value == value) {
        list->current = node;
    }
    if (list->current != 0) {
        func_800DB0AC(list->control, list->current->index, 0);
    }
    return node;
}
