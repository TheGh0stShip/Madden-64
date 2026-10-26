#include "types.h"

typedef struct VectorNode {
    u8 pad00[4];
    u32 count;
    u8 slots[7][16];
} VectorNode;

extern u8 D_80078300[];
extern VectorNode D_80064BB8[];
extern s32 D_80064BB0;
extern void func_80033308(s32, void *, s32, s32);
extern void func_8000DF34(VectorNode *node);
extern void func_8000E0BC(void *first, void *second, u8 index, s32 active);

void vector_slots_initialize(s32 node_index)
{
    VectorNode *node;
    u32 index;

    func_80033308(0, D_80078300, 0x118, 0);
    node = &D_80064BB8[node_index];
    func_8000DF34(node);

    index = 0;
    while (index < node->count) {
        func_8000E0BC(&node->slots[index][4], node->slots[index],
                      (u8)index, 1);
        index++;
    }
    while (index < 7) {
        func_8000E0BC(0, 0, (u8)index, 0);
        index++;
    }
    D_80064BB0 = node_index;
}
