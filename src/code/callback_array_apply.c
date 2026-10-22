#include "types.h"

typedef struct CallbackNode {
    void (*callback)(void*);
    void* argument;
    struct CallbackNode* next;
} CallbackNode;

void func_80008EA0(u32* array) {
    s32 count = array[0];

    while (count-- != 0) {
        CallbackNode* node = (CallbackNode*)array[count + 1];
        while (node != 0) {
            node->callback(node->argument);
            node = node->next;
        }
    }
}
