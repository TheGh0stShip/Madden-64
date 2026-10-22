#include "types.h"

typedef struct ObjectListNode ObjectListNode;

struct ObjectListNode {
    ObjectListNode* next;
    u8 pad[0x200];
    u16 order;
};

extern ObjectListNode D_8008B3D0;

void func_8000CBA8(ObjectListNode* object) {
    ObjectListNode* previous = &D_8008B3D0;
    ObjectListNode* current = previous;

    while (current != 0) {
        if (object->order < current->order) {
            break;
        }
        previous = current;
        current = previous->next;
    }
    object->next = previous->next;
    previous->next = object;
}
