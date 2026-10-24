#include "types.h"

typedef struct CallbackNode {
    u8 pad0[4];
    struct CallbackNode* next;
    u8 pad8[4];
    void (*callback)(struct CallbackNode*);
} CallbackNode;

void func_8000DC7C(u8* object) {
    CallbackNode* node = *(CallbackNode**)(object + 8);

    while (node != 0) {
        if (node->callback != 0) {
            node->callback(node);
        }
        node = node->next;
    }
}
