#include "types.h"

typedef struct ResourceHeader {
    u8 flags;
    u8 pad1[0xB];
    struct ResourceNested *nested;
    u8 pad10[2];
    u16 status;
} ResourceHeader;

typedef struct ResourceNested {
    u8 pad0[0x18];
    s32 count;
} ResourceNested;

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
extern void func_80032F3C(s32 pool, void *allocation);
extern s32 func_8001A488(ResourceHeader *resource);
extern void func_8001A914(ResourceHeader *resource, ResourceOwner *owner);

s32 resource_node_update(ResourceOwner *owner_arg)
{
    register ResourceOwner *owner __asm__("$19") = owner_arg;
    register ResourceState *state __asm__("$16") = owner->state;
    s32 result = 0;
    register s32 final_flags __asm__("$17");
    register s32 zero_arg __asm__("$4");
    s32 flags;
    register s32 mode __asm__("$3");
    register s32 condition __asm__("$2");
    void *buffer;
    ResourceHeader *resource;
    u64 stack_pad;

    resource = state->resource;
    flags = resource->flags;
    if (flags & 8) {
        condition = state->mode;
        mode = condition;
        if (condition == 0) {
            __asm__ volatile("" : "=r"(condition) : "0"(condition));
            __asm__ volatile("" : "=r"(mode) : "0"(mode));
            state->mode = 1 - mode;
            zero_arg = 0;
            func_80036540(zero_arg);
            func_800363F4(D_80085BF8, state->resource->nested->count,
                          state->first);
            state->resource->nested->count++;
            buffer = state->second;
        } else {
            __asm__ volatile("" : "=r"(mode) : "0"(mode));
            state->mode = 1 - mode;
            zero_arg = 0;
            func_80036540(zero_arg);
            func_800363F4(D_80085BF8, state->resource->nested->count,
                          state->second);
            state->resource->nested->count++;
            buffer = state->first;
        }
        func_8001A424(buffer, 100000, state->resource);
    } else if (flags & 0x10) {
        condition = state->mode;
        if (condition == 0) {
            __asm__ volatile("" : "=r"(condition) : "0"(condition));
            zero_arg = 0;
            func_80036540(zero_arg);
            func_8001A424(state->second, 100000, state->resource);
            func_80032F3C(0, state->first);
            state->first = 0;
            state->mode = 1 - state->mode;
        } else {
            zero_arg = 0;
            func_80036540(zero_arg);
            func_8001A424(state->first, 100000, state->resource);
            func_80032F3C(0, state->second);
            state->second = 0;
            state->mode = 1 - state->mode;
        }
    } else if (state->resource->status != 0xFFFF) {
        result = func_8001A488(state->resource);
    }
    __asm__ volatile("" : "=m"(stack_pad));
    resource = state->resource;
    final_flags = resource->flags;
    if (final_flags & 2) {
        func_8001A914(resource, owner);
    }
    if ((s8)result == -1) {
        state->resource->status = 0xFFFF;
    }
    return (s8)final_flags;
}
