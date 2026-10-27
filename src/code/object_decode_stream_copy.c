#include "types.h"

typedef void *(*ObjectBufferAllocate)(void *object, s32 value0, s32 value1,
                                      s32 value2, s32 mode);
typedef void (*ObjectCopy)(void *object, void *destination, const void *source,
                           u32 count);

typedef struct ObjectAllocatorMethods {
    u8 pad00[0x1C];
    ObjectBufferAllocate allocate;
} ObjectAllocatorMethods;

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

void func_8005CE00(u8 *object, s32 unused1, s32 unused2, s32 unused3,
                   u8 *source, u32 *source_position, u32 source_end)
{
    DecodeState *state;
    u32 count;
    u32 available;
    u32 size;

    state = *(DecodeState **)(object + 0x1AC);
    if (state->position == 0) {
        state->buffer = (*(ObjectAllocatorMethods **)(object + 4))->allocate(
            object, state->value8, state->base, state->size, 0);
    }

    count = state->size - state->position;
    available = source_end - *source_position;
    if (available < count) {
        count = available;
    }
    available = *(u32 *)(object + 0x74) - state->base;
    if (available < count) {
        count = available;
    }

    (*(ObjectCopyMethods **)(object + 0x1C8))->copy(
        object,
        (u8 *)state->buffer + state->position * 4,
        source + *source_position * 4,
        count);
    *source_position += count;
    state->position += count;
    size = state->size;
    if (state->position >= size) {
        state->position = 0;
        state->base += size;
    }
}
