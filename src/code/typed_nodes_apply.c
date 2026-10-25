#include "types.h"

typedef struct TypedNode {
    u8 pad[4];
    struct TypedNode* next;
    u8 middle[0x4C];
    u16 type;
} TypedNode;

typedef struct TypedNodeOwner {
    u8 pad[8];
    TypedNode* first;
} TypedNodeOwner;

extern void func_80033B20(TypedNode* node, s32 value);

void func_8003456C(TypedNodeOwner* owner, s32 value) {
    TypedNode* node;

    node = owner->first;
    while (node != 0) {
        if (node->type == 6 || node->type == 11 || node->type == 7) {
            func_80033B20(node, value);
        }
        node = node->next;
    }
}
