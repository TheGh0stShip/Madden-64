#include "types.h"

typedef struct NameTableDF508 {
    u8 pad00;
    u8 index;
    u8 pad02[2];
    void **entries;
} NameTableDF508;

typedef struct DescriptorDF508 {
    u8 pad00[4];
    u16 flags;
    u8 pad06[2];
    NameTableDF508 *names;
} DescriptorDF508;

typedef struct NodeDF508 {
    struct NodeDF508 *unused;
    struct NodeDF508 *next;
    u8 pad08[4];
    DescriptorDF508 *descriptor;
    u8 id;
} NodeDF508;

typedef struct ContextDF508 {
    u8 pad00[8];
    NodeDF508 *head;
} ContextDF508;

extern s8 D_80002528[];
extern s8 D_80002529[];

void func_8002E65C(void *, const void *);

void func_800DF508(u16 id, volatile u8 *destination, ContextDF508 *context) {
    NodeDF508 *node;
    u8 index;

    node = context->head;
    index = 0;
    do {
        if (node->id == id) {
            DescriptorDF508 *descriptor = node->descriptor;

            if ((descriptor->flags & 3) == 1) {
                NameTableDF508 *names = descriptor->names;

                func_8002E65C(destination, names->entries[names->index * 2]);
            } else {
                s32 first = D_80002528[0];
                s32 second = D_80002529[0];

                destination[0] = first;
                destination[1] = second;
            }
            break;
        }
        index++;
        node = node->next;
    } while (id >= index);
}
