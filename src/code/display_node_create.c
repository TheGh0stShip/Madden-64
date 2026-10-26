#include "types.h"

typedef struct DisplayNode DisplayNode;
typedef struct DisplayListOwner {
    u8 pad00[8];
    DisplayNode *head;
    DisplayNode *tail;
} DisplayListOwner;

struct DisplayNode {
    DisplayNode *next;
    DisplayNode *previous;
    void *payload;
    u32 field0C;
    u32 field10;
    u32 active;
    u8 pad18[0x34];
    u32 field4C;
    u32 field50;
    u16 type;
};

typedef struct DisplayTypeDescriptor {
    u8 pad00[0x10];
    void (*initialize)(DisplayNode *, void *);
    u8 pad14[4];
} DisplayTypeDescriptor;

extern void *D_800782F4;
extern void **D_800782F8;
extern DisplayTypeDescriptor *D_800782FC;
extern void *func_80033298(void *);

DisplayNode *display_node_create(DisplayListOwner *owner, u16 type, void *argument)
{
    DisplayNode *node = func_80033298(D_800782F4);
    u32 index;
    register DisplayTypeDescriptor *descriptor __asm__("$3");

    if (owner->head != 0) {
        node->next = 0;
        node->previous = owner->head;
        owner->head->next = node;
        owner->head = node;
    } else {
        owner->tail = node;
        owner->head = node;
        node->previous = 0;
        node->next = 0;
    }
    node->active = 1;
    node->field10 = 0;
    node->field0C = 0;
    node->type = type;
    index = type;
    node->payload = func_80033298(D_800782F8[index]);
    descriptor = D_800782FC;
    descriptor = (DisplayTypeDescriptor *)((u8 *)descriptor + index * 0x18);
    descriptor->initialize(node, argument);
    node->field4C = 0;
    node->field50 = 0;
    return node;
}
