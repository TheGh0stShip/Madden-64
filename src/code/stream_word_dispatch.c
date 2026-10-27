#include "types.h"

typedef struct StreamContext StreamContext;

typedef struct StreamEvent {
    u32 (*dispatch)(StreamContext *context);
    u32 (*dispatch_mode)(StreamContext *context, u32 mode);
    u8 pad8[12];
    u32 type;
    u32 first;
    u32 second;
} StreamEvent;

typedef struct StreamBuffer {
    u8 *cursor;
    s32 remaining;
    u32 field8;
    u32 (*refill)(StreamContext *context);
    u32 (*consume)(StreamContext *context, u32 size);
} StreamBuffer;

struct StreamContext {
    StreamEvent *event;
    u8 pad4[16];
    StreamBuffer *stream;
    u8 pad18[0x184];
    u32 stream_value;
};

u32 func_80058384(StreamContext *context)
{
    register StreamContext *saved_context __asm__("$19") = context;
    register StreamBuffer *stream __asm__("$18") = context->stream;
    register u8 *cursor __asm__("$17") = stream->cursor;
    register s32 remaining __asm__("$16") = stream->remaining;
    register u32 value __asm__("$20");

    if (remaining == 0) {
        if (stream->refill(saved_context) == 0) {
            return 0;
        }
        cursor = stream->cursor;
        remaining = stream->remaining;
    }

    value = *cursor++ << 8;
    remaining--;
    if (remaining == 0) {
        if (stream->refill(saved_context) == 0) {
            return 0;
        }
        cursor = stream->cursor;
        remaining = stream->remaining;
    }

    value += *cursor++;
    remaining--;
    saved_context->event->type = 0x5A;
    saved_context->event->first = saved_context->stream_value;
    saved_context->event->second = value;
    saved_context->event->dispatch_mode(saved_context, 1);
    stream->cursor = cursor;
    stream->remaining = remaining;
    saved_context->stream->consume(saved_context, value - 2);
    return 1;
}
