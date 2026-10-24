#include "types.h"

typedef struct SearchNode {
    u32 value;
    u8 pad4[8];
    struct SearchNode* next;
} SearchNode;

extern SearchNode* D_8007A414[];

SearchNode* func_80033644(u32 value, s16 list) {
    SearchNode* node = D_8007A414[list];

    while (node != (SearchNode*)-1 && node->value < value) {
        node = node->next;
    }

    return node;
}
