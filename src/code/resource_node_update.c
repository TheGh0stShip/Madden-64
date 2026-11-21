#include "types.h"

typedef struct ResourceNested {
    u8 pad0[0x18];
    s32 count;
} ResourceNested;

typedef struct ResourceHeader {
    u8 flags;
    u8 pad1[0xB];
    ResourceNested *nested;
    u8 pad10[2];
    u16 status;
} ResourceHeader;

typedef struct ResourceState {
    u8 pad0[0x20];
    void *first;
    void *second;
    ResourceHeader *resource;
    u8 pad2C[0x12];
    s16 mode;
} ResourceState;

typedef struct ResourceOwner {
    u8 pad0[8];
    ResourceState *state;
} ResourceOwner;

extern u16 D_80085BF8;
extern void func_80036540(s32 value);
extern void func_800363F4(u16 global, s32 index, void *buffer);
extern void func_8001A424(void *buffer, u32 size, ResourceHeader *resource);
extern void memory_pool_block_resize(s32 pool, void *allocation);
extern s32 animation_step_update(ResourceHeader *resource);
extern void func_8001A914(ResourceHeader *resource, ResourceOwner *owner);

s8 resource_node_update(ResourceOwner *owner) {
    ResourceState *state = owner->state;
    s8 result = 0;
    s8 flags;
    u8 resourceFlags = state->resource->flags;

    if (resourceFlags & 8) {
        if (state->mode == 0) {
            state->mode = 1 - state->mode;
            func_80036540(0);
            func_800363F4(D_80085BF8, state->resource->nested->count, state->first);
            state->resource->nested->count++;
            func_8001A424(state->second, 100000, state->resource);
        } else {
            state->mode = 1 - state->mode;
            func_80036540(0);
            func_800363F4(D_80085BF8, state->resource->nested->count, state->second);
            state->resource->nested->count++;
            func_8001A424(state->first, 100000, state->resource);
        }
    } else if (resourceFlags & 0x10) {
        if (state->mode == 0) {
            func_80036540(0);
            func_8001A424(state->second, 100000, state->resource);
            memory_pool_block_resize(0, state->first);
            state->first = 0;
            state->mode = 1 - state->mode;
        } else {
            func_80036540(0);
            func_8001A424(state->first, 100000, state->resource);
            memory_pool_block_resize(0, state->second);
            state->second = 0;
            state->mode = 1 - state->mode;
        }
    } else if (state->resource->status != 0xFFFF) {
        result = animation_step_update(state->resource);
    }
    flags = state->resource->flags;
    if (flags & 2) {
        func_8001A914(state->resource, owner);
    }
    if (result == -1) {
        state->resource->status = 0xFFFF;
    }
    return flags;
}
