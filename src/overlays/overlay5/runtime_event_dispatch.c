#include "types.h"

#ifndef EVENT_OFFSET
#define EVENT_OFFSET 0
#endif

typedef struct RuntimeEventOwner {
    u8 pad00[0x20];
    u8 *cursor;
} RuntimeEventOwner;

typedef struct RuntimeEventContext {
    u8 pad00[0x28];
    RuntimeEventOwner *target;
} RuntimeEventContext;

typedef struct RuntimeEventResult {
    u8 pad00[4];
    u8 *cursor;
    u8 pad08[8];
} RuntimeEventResult;

void func_8001F070(
    RuntimeEventOwner *target,
    s32 event,
    RuntimeEventResult *result
);

void overlay5_runtime_event_dispatch(
    RuntimeEventOwner *owner,
    u8 event,
    RuntimeEventContext *context
) {
    RuntimeEventResult result;
    RuntimeEventOwner *target;

    target = context->target;
    if (target->cursor == 0) {
        result.cursor = owner->cursor + 0x10;
        func_8001F070(target, event + EVENT_OFFSET, &result);
        owner->cursor = result.cursor - 0x10;
    }
}
