#include "types.h"

typedef struct LinkedNode {
    struct LinkedNode* next;
} LinkedNode;

extern LinkedNode D_8008B3D0;

void func_8000CBEC(LinkedNode* node) {
    LinkedNode* previous = 0;
    LinkedNode* current = &D_8008B3D0;

    if (node != current) {
        previous = current;
        while ((current = previous->next) != node) {
            previous = current;
        }
    }
    previous->next = current->next;
}
