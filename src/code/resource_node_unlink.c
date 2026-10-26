#include "types.h"

typedef struct ResourceLink {
    u8 pad00[0xC];
    struct ResourceLink *next;
    struct ResourceLink *previous;
    u8 pad14[8];
} ResourceLink;

extern ResourceLink *D_8007A400[];
extern u16 *D_8007A408[];
extern ResourceLink *D_8007A414[];
extern void func_80033534(ResourceLink *node);

void resource_node_unlink(ResourceLink *node, s16 list)
{
    ResourceLink *previous = node->previous;
    ResourceLink *next = node->next;
    register u16 *output __asm__("$2");
    register ResourceLink *call_node __asm__("$4");
    u32 index;

    if (previous != (ResourceLink *)-1) {
        previous->next = next;
    } else {
        D_8007A414[list] = next;
    }
    if (next != (ResourceLink *)-1) {
        next->previous = previous;
    }
    index = ((u32)node - (u32)D_8007A400[list]) / 28;
    output = D_8007A408[list];
    call_node = node;
    output++;
    __asm__ volatile("" : "=r"(output) : "0"(output), "r"(call_node));
    *output = index;
    D_8007A408[list] = output;
    func_80033534(call_node);
}
