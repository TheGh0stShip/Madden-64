#include "types.h"

typedef struct ImageDecodeContext ImageDecodeContext;

typedef struct ImageDecodeEvent {
    void (*dispatch)(ImageDecodeContext *context);
    u8 pad4[16];
    u32 type;
} ImageDecodeEvent;

typedef struct ImageDecodeAllocator {
    void *(*allocate)(ImageDecodeContext *context, u32 count, u32 size);
} ImageDecodeAllocator;

typedef struct ImageDecodeBlock {
    void (*entry)(void);
    void (*handler)(void);
    u8 pad8[16];
} ImageDecodeBlock;

typedef struct ImageRowState {
    u8 pad00[0x30];
    u32 value30;
    u8 pad34[0x20];
} ImageRowState;

struct ImageDecodeContext {
    ImageDecodeEvent *event;
    ImageDecodeAllocator *allocator;
    u8 pad08[0x18];
    s32 row_count;
    u32 format;
    u32 mode;
    u8 pad2C[0x28];
    u32 field54;
    u8 pad58[0x20];
    u32 decoded_count;
    u32 active_count;
    u8 pad80[0x58];
    ImageRowState *rows;
    u8 padDC[0xE8];
    ImageDecodeBlock *block;
};

extern void func_8005FCFC(void);
extern void func_8005FB60(void);
extern void func_8005F998(void);
extern void func_8005FB9C(void);
extern void func_8005FAD4(void);
extern void func_8005F868(ImageDecodeContext *context);

#define IMAGE_DECODE_ERROR(context, value) do { \
    (context)->event->type = (value); \
    (context)->event->dispatch(context); \
} while (0)

void image_block_decode(ImageDecodeContext *context)
{
    ImageDecodeBlock *block = context->allocator->allocate(context, 1, 0x18);
    s32 row;
    u32 active_count;

    context->block = block;
    block->entry = func_8005FCFC;

    switch (context->format) {
    case 1:
        if (context->row_count != 1) {
            IMAGE_DECODE_ERROR(context, 8);
        }
        break;
    case 2:
    case 3:
        if (context->row_count != 3) {
            IMAGE_DECODE_ERROR(context, 8);
        }
        break;
    case 4:
    case 5:
        if (context->row_count != 4) {
            IMAGE_DECODE_ERROR(context, 8);
        }
        break;
    default:
        if (context->row_count <= 0) {
            IMAGE_DECODE_ERROR(context, 8);
        }
        break;
    }

    switch (context->mode) {
    case 1:
        context->decoded_count = 1;
        if (context->format == 1 || context->format == 3) {
            block->handler = func_8005FB60;
            for (row = 1; row < context->row_count; row++) {
                context->rows[row].value30 = 0;
            }
        } else {
            IMAGE_DECODE_ERROR(context, 0x19);
        }
        break;
    case 2: {
        u32 format = *(volatile u32 *)&context->format;

        context->decoded_count = 3;
        if (format == 3) {
            block->handler = func_8005F998;
            func_8005F868(context);
        } else if (format == 2) {
            block->handler = func_8005FAD4;
        } else {
            IMAGE_DECODE_ERROR(context, 0x19);
        }
        break;
    }
    case 4:
        context->decoded_count = 4;
        if (context->format == 5) {
            block->handler = func_8005FB9C;
            func_8005F868(context);
        } else if (context->format == 4) {
            block->handler = func_8005FAD4;
        } else {
            IMAGE_DECODE_ERROR(context, 0x19);
        }
        break;
    default:
        if (context->mode == context->format) {
            context->decoded_count = context->row_count;
            block->handler = func_8005FAD4;
        } else {
            IMAGE_DECODE_ERROR(context, 0x19);
        }
        break;
    }

    if (context->field54 != 0) {
        active_count = 1;
    } else {
        active_count = context->decoded_count;
    }
    context->active_count = active_count;
}
