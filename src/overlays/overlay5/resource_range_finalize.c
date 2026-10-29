#include "types.h"

typedef struct Overlay5RangeMeta {
    u8 pad00[0xB];
    u8 first;
    u8 second;
} Overlay5RangeMeta;

typedef struct Overlay5RangeState {
    u8 pad00[4];
    Overlay5RangeMeta *meta;
    u8 pad08[0xD];
    u8 active_count;
    u8 pad16[0xE];
    u16 saved_count;
    u8 pad26[2];
    u8 saved_first;
    u8 pad29[0x4A];
    u8 resource_count;
    void **resources;
} Overlay5RangeState;

typedef struct Overlay5RangeOwner {
    u8 pad00[0xC];
    Overlay5RangeState *state;
} Overlay5RangeOwner;

void func_800DFE6C(void);
void func_8000DC18(void *resource);
void func_800DB478(void *range);

void overlay5_resource_range_finalize(
    Overlay5RangeOwner *owner,
    s32 unused,
    s32 decrement
) {
    Overlay5RangeState *state;
    u8 index;

    state = owner->state;
    if (decrement & 1) {
        state->meta->first--;
        state->meta->second--;
    }
    state->active_count--;
    func_800DFE6C();
    if (state->resources != 0) {
        index = state->meta->first;
        while (index < state->resource_count) {
            func_8000DC18(state->resources[index]);
            index++;
        }
    }
    state->saved_count = state->active_count;
    state->saved_first = state->meta->first;
    func_800DB478((u8 *)state + 0x1C);
}
