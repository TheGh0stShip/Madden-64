#include "types.h"

typedef struct ChildOwner { u8 pad[8]; void *head; } ChildOwner;
typedef struct ResourceData {
    u8 pad0[0xA]; u16 count; u8 pad1[0xC]; ChildOwner *owner; u8 pad2[4];
    u8 *secondary_flags; u8 *primary_flags; void **primary_items; void **secondary_items;
} ResourceData;
typedef struct ResourceHandle { u8 pad[8]; ResourceData *data; } ResourceHandle;

extern void *D_8008931C;
extern void func_8000D874(ChildOwner *, void *);
extern void func_8000D834(void *, void *);

void resource_children_detach(ResourceHandle *handle)
{
    ResourceData *data = handle->data;
    ChildOwner *owner = data->owner;
    void *child;
    u32 index;
    u32 check;

    data->count = 0;
    while (owner->head != 0) {
        child = owner->head;
        func_8000D874(owner, child);
        func_8000D834(D_8008931C, child);
        owner = data->owner;
    }
    if (data->primary_flags != 0) {
        index = (u32)data->primary_items[0];
        check = index;
        index--;
        if (check != 0) {
            do {
                u32 current = index;
                data->primary_flags[index + 1] = 0;
                data->primary_items[index + 1] = 0;
                index--;
                if (current == 0) break;
            } while (1);
        }
    }
    if (data->secondary_flags != 0) {
        index = (u32)data->secondary_items[0];
        check = index;
        index--;
        if (check != 0) {
            do {
                u32 current = index;
                data->secondary_flags[index + 1] = 0;
                data->secondary_items[index + 1] = 0;
                index--;
                if (current == 0) break;
            } while (1);
        }
    }
}
