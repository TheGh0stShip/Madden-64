#include "types.h"

typedef struct Node {
    u8 pad00[8];
    struct Node *next;
    s32 unk0C;
    u8 pad10[0x54];
    s32 unk64;
} Node;

void func_8009BC9C(Node *arg0, Node *arg1) {
    Node *node = arg0->next;
    Node *other = arg1->next;

    node->next = arg1;
    node->unk0C = other->unk64;
}
