#include "types.h"

typedef struct RuntimeNode {
    u16 type;
    u16 priority;
    void *value;
    u8 data[0xC];
    u16 field14;
    u16 type_copy;
    struct RuntimeNode *next;
} RuntimeNode;

extern RuntimeNode *D_8008773C;
extern void *D_8008AFBC;
extern RuntimeNode *func_80033298(void *);
extern void func_80033308(s32, void *, s32, s32);

RuntimeNode *runtime_node_insert(void *value, u16 priority, u16 type)
{
    RuntimeNode *cursor = D_8008773C;
    RuntimeNode *node;
    u32 key;

    if (cursor->next == 0) {
        goto insert;
    }
    key = priority;
walk:
    if (cursor->priority >= key) {
        goto insert;
    }
    cursor = cursor->next;
    if (cursor->next != 0) {
        goto walk;
    }
insert:
    node = func_80033298(D_8008AFBC);
    node->next = cursor->next;
    cursor->next = node;
    node->type = type;
    node->type_copy = type;
    node->priority = priority;
    node->value = value;
    func_80033308(0, node->data, 0xC, 0);
    node->field14 = 0;
    return node;
}
