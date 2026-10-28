#include "types.h"

typedef void (*NodeCallback)(void *node, void *argument);

extern u8 *D_800782FC;

void node_callbacks_apply(u8 *owner, void *argument)
{
    void *saved_argument = argument;
    u8 *node;

    node = *(u8 **)(owner + 8);
    while (node != 0) {
        u8 *next = *(u8 **)(node + 4);

        if ((*(u32 *)(node + 0x14) & 1) == 0) {
            node = next;
            continue;
        }
        {
            u32 index = *(u16 *)(node + 0x54);
            u8 *entry = D_800782FC + index * 24;
            NodeCallback callback = *(NodeCallback *)(entry + 0x1C);

            callback(node, saved_argument);
        }
        node = next;
    }
}
