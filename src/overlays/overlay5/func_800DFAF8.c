#include "types.h"

typedef struct Overlay5LookupNode {
    u8 pad0[4];
    struct Overlay5LookupNode* next;
    s16 value;
    u8 padA[2];
    void* key;
    u8 type;
} Overlay5LookupNode;

typedef struct Overlay5LookupList {
    u8 pad0[8];
    Overlay5LookupNode* head;
    Overlay5LookupNode* special;
    u8 pad10[0xC];
    u8 object1C[1];
} Overlay5LookupList;

typedef struct Overlay5LookupOwner {
    u8 pad0[0xC];
    Overlay5LookupList* list;
} Overlay5LookupOwner;

extern void func_800DC8B8(void* object, u8 type, s32 mode);

void func_800DFAF8(Overlay5LookupOwner* owner, void* key, s16 value) {
    Overlay5LookupList* list = owner->list;
    Overlay5LookupNode* node = list->head;

    while (node != 0 && node->key != key) {
        node = node->next;
    }

    node->value = value;
    if (value == 0) {
        func_800DC8B8(list->object1C, node->type, 5);
    } else if (node == list->special) {
        func_800DC8B8(list->object1C, node->type, 6);
    } else {
        func_800DC8B8(list->object1C, node->type, 0);
    }
}
