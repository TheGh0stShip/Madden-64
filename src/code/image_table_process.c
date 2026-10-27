#include "types.h"

typedef struct ImageTableProcessContext ImageTableProcessContext;

typedef struct ImageTableEvent {
    void (*entry)(void);
    void (*dispatch)(ImageTableProcessContext *context, s32 value);
    u8 pad08[0x0C];
    u32 type;
    u32 value;
    u32 sizes[3];
} ImageTableEvent;

typedef struct ImageTableAllocator {
    void *(*allocate_simple)(void);
    void *(*allocate_other)(void);
    void *(*allocate)(ImageTableProcessContext *context, u32 count,
        u32 size, u32 dimensions);
} ImageTableAllocator;

typedef struct ImageTableProcessState {
    u8 pad00[0x10];
    u8 **tables;
    s32 total;
    u8 pad18[8];
    s32 sizes[1];
} ImageTableProcessState;

struct ImageTableProcessContext {
    ImageTableEvent *event;
    ImageTableAllocator *allocator;
    u8 pad008[0x70];
    s32 dimensions;
    u8 pad07C[0x14C];
    ImageTableProcessState *state;
};

extern s32 image_table_finalize(ImageTableProcessContext *context, s32 *sizes);
extern s32 func_800600E0(ImageTableProcessContext *context, s32 dimension,
    s32 coordinate, s32 maximum);

void image_table_process(ImageTableProcessContext *context)
{
    register ImageTableProcessContext *saved_context __asm__("$19");
    register ImageTableProcessState *state;
    register s32 total __asm__("$23");
    register s32 remaining __asm__("$21");
    register s32 dimension __asm__("$20");
    register ImageTableProcessState *state_cursor __asm__("$8");
    register u8 **table_slot __asm__("$9");
    u8 **volatile tables;
    u64 stack_padding0;
    u64 stack_padding1;
    u64 stack_padding2;

    __asm__("" : "=r"(saved_context) : "0"(context));
    state = saved_context->state;
    __asm__("" : : "m"(stack_padding0), "m"(stack_padding1),
        "m"(stack_padding2));
    total = image_table_finalize(context, state->sizes);
    if (saved_context->dimensions == 3) {
        ImageTableEvent *event = saved_context->event;

        event->value = total;
        event->sizes[0] = state->sizes[0];
        event->sizes[1] = state->sizes[1];
        event->sizes[2] = state->sizes[2];
        __asm__("" : : : "memory");
        saved_context->event->type = 0x5D;
    } else {
        ImageTableEvent *event = saved_context->event;

        event->type = 0x5E;
        __asm__("" : : : "memory");
        saved_context->event->value = total;
    }
    saved_context->event->dispatch(saved_context, 1);

    tables = saved_context->allocator->allocate(
        saved_context, 1, total, saved_context->dimensions);
    table_slot = tables;
    remaining = total;
    dimension = 0;
    if (saved_context->dimensions > 0) {
        state_cursor = state;
        do {
            register s32 size __asm__("$18") = state_cursor->sizes[0];
            register s32 stride __asm__("$17") = remaining / size;
            register s32 coordinate __asm__("$16") = 0;
            register u8 **dimension_slot __asm__("$22") = table_slot;

            if (size > 0) {
                do {
                    s32 value = func_800600E0(saved_context, dimension,
                        coordinate, size - 1);
                    s32 base = coordinate * stride;

                    while (base < total) {
                        s32 offset = 0;

                        while (offset < stride) {
                            (*dimension_slot)[base + offset] = value;
                            offset++;
                        }
                        base += remaining;
                    }
                    coordinate++;
                } while (coordinate < size);
            }
            remaining = stride;
            table_slot++;
            state_cursor = (ImageTableProcessState *)((u8 *)state_cursor + 4);
            dimension++;
        } while (dimension < saved_context->dimensions);
    }
    state->tables = tables;
    state->total = total;
}
