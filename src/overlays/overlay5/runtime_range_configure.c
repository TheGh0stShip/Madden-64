#include "types.h"

typedef struct Overlay5RangeSystem {
    u8 pad00[0xC];
    u16 current;
    u16 selected;
    u16 end;
    u16 start;
    void *resource;
} Overlay5RangeSystem;

extern Overlay5RangeSystem *D_80072460;

s32 func_80031A1C(u16 range);

void overlay5_runtime_range_configure(
    void *resource,
    u16 start,
    u16 end
) {
    Overlay5RangeSystem *system;
    u16 range;
    s32 selected;

    system = D_80072460;
    system->start = start;
    system->resource = resource;
    system->current = 0;
    system->end = end;
    range = end - system->start + 1;
    selected = func_80031A1C(range);
    D_80072460->selected = D_80072460->start + selected;
}
