#include "types.h"

typedef void *(*ObjectBufferAllocate)(void *object, s32 value0, s32 value1,
                                      s32 value2, s32 mode);
typedef void (*ObjectDecode)(void *object, s32 value0, s32 value1, s32 value2,
                             void *buffer, u32 *position, u32 size);
typedef void (*ObjectCopy)(void *object, void *destination, const void *source,
                           u32 count);

typedef struct ObjectAllocatorMethods {
    u8 pad00[0x1C];
    ObjectBufferAllocate allocate;
} ObjectAllocatorMethods;

typedef struct ObjectDecodeMethods {
    u8 pad00[4];
    ObjectDecode decode;
} ObjectDecodeMethods;

typedef struct ObjectCopyMethods {
    u8 pad00[4];
    ObjectCopy copy;
} ObjectCopyMethods;

typedef struct DecodeState {
    u8 pad00[8];
    s32 value8;
    void *buffer;
    u32 size;
    u32 base;
    u32 position;
} DecodeState;

void func_8005CCCC(u8 *object, s32 value0, s32 value1, s32 value2,
                   s32 unused, u32 *produced)
{
    DecodeState *state;
    u32 previous;
    u32 count;
    u32 size;
    u32 position;

    state = *(DecodeState **)(object + 0x1AC);
    if (state->position == 0) {
        state->buffer = (*(ObjectAllocatorMethods **)(object + 4))->allocate(
            object, state->value8, state->base, state->size, 1);
    }

    previous = state->position;
    (*(ObjectDecodeMethods **)(object + 0x1C0))->decode(
        object, value0, value1, value2,
        state->buffer, &state->position, state->size);

    if (previous < state->position) {
        count = state->position - previous;
        (*(ObjectCopyMethods **)(object + 0x1C8))->copy(
            object, (u8 *)state->buffer + previous * 4, 0, count);
        *produced += count;
    }

    position = state->position;
    size = state->size;
    if (position >= size) {
        state->position = 0;
        state->base += size;
    }
}
