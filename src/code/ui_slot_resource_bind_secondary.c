#include "types.h"

typedef struct UiSecondaryOwner {
    void **slot_bindings;
    u8 pad0[0x14];
    void *resource_context;
    u8 pad_context[4];
    u8 *flags;
    u8 pad1[8];
    void **resources;
} UiSecondaryOwner;

typedef struct UiSecondaryContext {
    u8 pad[8];
    UiSecondaryOwner *owner;
} UiSecondaryContext;

extern void *D_8008931C;
extern void func_8000D874(void *context, void *resource);
extern void func_8000D834(void *context, void *resource);

void ui_slot_resource_bind_secondary(UiSecondaryContext *context, s32 source_slot, s32 destination_slot)
{
    UiSecondaryOwner *owner = context->owner;
    void *cleanup_resource;
    void *moved_resource;

    if (owner->slot_bindings[destination_slot] != 0) {
        cleanup_resource = owner->resources[destination_slot];
        func_8000D874(owner->resource_context, cleanup_resource);
        func_8000D834(D_8008931C, cleanup_resource);
    }

    moved_resource = owner->resources[source_slot];
    if (moved_resource != 0) {
        owner->resources[source_slot] = 0;
        owner->flags[destination_slot] = owner->flags[source_slot] | 0x40;
        owner->flags[source_slot] &= 0x7F;
        owner->resources[destination_slot] = moved_resource;
    }

    owner->slot_bindings[destination_slot] = owner->slot_bindings[source_slot];
    __asm__ volatile("" : : : "memory");
    owner->slot_bindings[source_slot] = 0;
}
