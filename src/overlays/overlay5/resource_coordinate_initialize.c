#include "types.h"

typedef struct Overlay5CoordinatePair {
    s32 first;
    s32 second;
    u8 pad08[8];
} Overlay5CoordinatePair;

typedef struct Overlay5CoordinateState {
    u8 pad00[0x20];
    s32 coordinate;
} Overlay5CoordinateState;

typedef struct Overlay5CoordinateContext {
    u8 pad00[0x28];
    Overlay5CoordinateState *state;
} Overlay5CoordinateContext;

void func_8001F070(
    Overlay5CoordinateState *state,
    s32 index,
    Overlay5CoordinatePair *coordinates
);

void overlay5_resource_coordinate_initialize(
    Overlay5CoordinateState *destination,
    u8 kind,
    Overlay5CoordinateContext *context
) {
    Overlay5CoordinateState *state;
    Overlay5CoordinatePair coordinates;

    state = context->state;
    if (state->coordinate == 0) {
        coordinates.second = destination->coordinate + 0x10;
        func_8001F070(state, kind + 3, &coordinates);
        destination->coordinate = coordinates.second - 0x10;
    }
}
