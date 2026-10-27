#include "types.h"

typedef struct MarkerContext MarkerContext;

typedef struct MarkerEvent {
    u32 (*dispatch)(MarkerContext *context);
    u8 pad4[16];
    u32 type;
    u32 first;
    u32 second;
} MarkerEvent;

typedef struct MarkerStream {
    u8 *cursor;
    s32 remaining;
    u32 field8;
    u32 (*refill)(MarkerContext *context);
} MarkerStream;

struct MarkerContext {
    MarkerEvent *event;
    u8 pad4[16];
    MarkerStream *stream;
    u8 pad18[0x184];
    u32 marker;
};

u32 func_80058624(MarkerContext *context)
{
    register MarkerContext *saved_context __asm__("$19") = context;
    register MarkerStream *stream __asm__("$18") = context->stream;
    register u8 *cursor __asm__("$17") = stream->cursor;
    register s32 remaining __asm__("$16") = stream->remaining;
    register u32 first __asm__("$21");
    register u32 second __asm__("$20");

    if (remaining == 0) {
        if (stream->refill(saved_context) == 0) {
            return 0;
        }
        cursor = stream->cursor;
        remaining = stream->remaining;
    }

    first = *cursor++;
    remaining--;
    if (remaining == 0) {
        if (stream->refill(saved_context) == 0) {
            return 0;
        }
        cursor = stream->cursor;
        remaining = stream->remaining;
    }

    second = *cursor++;
    remaining--;
    if (first != 0xFF || second != 0xD8) {
        saved_context->event->type = 0x34;
        saved_context->event->first = first;
        saved_context->event->second = second;
        saved_context->event->dispatch(saved_context);
    }
    saved_context->marker = second;
    stream->cursor = cursor;
    stream->remaining = remaining;
    return 1;
}
