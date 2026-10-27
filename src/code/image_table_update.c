#include "types.h"

typedef struct ImageTableUpdateContext ImageTableUpdateContext;

typedef struct ImageTableUpdateEvent {
    void (*dispatch)(ImageTableUpdateContext *context);
    u8 pad04[0x10];
    u32 type;
} ImageTableUpdateEvent;

typedef struct ImageTableUpdateState {
    u8 pad00[4];
    void (*handler)(void);
    u8 pad08[8];
    void *tables;
    u32 total;
    u8 pad18[4];
    void *field1C;
    u8 pad20[0x10];
    u32 phase;
    void *field34;
    u8 pad38[0x0C];
    void *buffers[1];
    u8 pad48[0x0C];
    u32 field54;
} ImageTableUpdateState;

struct ImageTableUpdateContext {
    ImageTableUpdateEvent *event;
    u8 pad004[0x54];
    u32 mode;
    u8 pad05C[0x14];
    s32 width;
    u8 pad074[4];
    s32 dimensions;
    u8 pad07C[8];
    u32 total;
    void *tables;
    u8 pad08C[0x13C];
    ImageTableUpdateState *state;
};

extern void index_planes_accumulate(void);
extern void indexed_rgb_accumulate(void);
extern void func_80060870(void);
extern void func_8006099C(void);
extern void object_table_process(void);
extern void image_table_decode(ImageTableUpdateContext *context);
extern void object_shared_buffers_assign(ImageTableUpdateContext *context);
extern void object_children_allocate(ImageTableUpdateContext *context);
extern void func_800632F4(void *output, s32 size);

void image_table_update(ImageTableUpdateContext *context)
{
    register ImageTableUpdateContext *saved_context __asm__("$18") = context;
    register ImageTableUpdateState *state __asm__("$17") = context->state;
    register s32 index __asm__("$16");
    register s32 size __asm__("$19");
    register s32 raw_size __asm__("$2");
    u32 stack_padding;

    __asm__("" : : "m"(stack_padding));

    saved_context->tables = state->tables;
    saved_context->total = state->total;

    switch (saved_context->mode) {
    case 0:
        if (saved_context->dimensions == 3) {
            state->handler = indexed_rgb_accumulate;
        } else {
            state->handler = index_planes_accumulate;
        }
        break;
    case 1:
        if (saved_context->dimensions == 3) {
            state->handler = func_8006099C;
        } else {
            state->handler = func_80060870;
        }
        state->phase = 0;
        if (state->field1C == 0) {
            image_table_decode(saved_context);
        }
        if (state->field34 == 0) {
            object_shared_buffers_assign(saved_context);
        }
        break;
    case 2:
        state->handler = object_table_process;
        state->field54 = 0;
        if (state->buffers[0] == 0) {
            object_children_allocate(saved_context);
        }
        index = 0;
        raw_size = saved_context->width + 2;
        if (saved_context->dimensions > 0) {
            size = raw_size * 2;
            do {
                func_800632F4(state->buffers[0], size);
                index++;
                state = (ImageTableUpdateState *)((u8 *)state + 4);
            } while (index < saved_context->dimensions);
        }
        break;
    default:
        saved_context->event->type = 0x2F;
        saved_context->event->dispatch(saved_context);
        break;
    }
}
