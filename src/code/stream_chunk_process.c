#include "types.h"

typedef struct ChunkContext ChunkContext;

typedef struct ChunkEvent {
    u32 (*dispatch)(ChunkContext *context);
    u32 (*dispatch_mode)(ChunkContext *context, s32 mode);
    u8 pad8[12];
    u32 type;
    u32 value;
} ChunkEvent;

typedef struct ChunkLink {
    u32 (*dispatch)(ChunkContext *context);
    u32 position;
    u32 limit;
} ChunkLink;

typedef struct ChunkOps {
    u32 field0;
    void (*process)(ChunkContext *context, void *source, u32 *consumed,
                    void *argument);
} ChunkOps;

struct ChunkContext {
    ChunkEvent *event;
    u32 field4;
    ChunkLink *link;
    u32 fieldC;
    u32 state;
    u8 pad14[0x60];
    u32 limit;
    u8 pad78[0x14];
    u32 position;
    u8 pad90[0x114];
    ChunkOps *ops;
};

u32 func_800549E8(ChunkContext *context, void *source, void *argument)
{
    u32 consumed;

    if (context->state != 0xCD) {
        context->event->type = 0x12;
        context->event->value = context->state;
        context->event->dispatch(context);
    }

    if (context->position >= context->limit) {
        context->event->type = 0x77;
        context->event->dispatch_mode(context, -1);
        return 0;
    }

    if (context->link != 0) {
        context->link->position = context->position;
        context->link->limit = context->limit;
        context->link->dispatch(context);
    }

    consumed = 0;
    context->ops->process(context, source, &consumed, argument);
    context->position += consumed;
    return consumed;
}
