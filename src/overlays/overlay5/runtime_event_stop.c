#include "types.h"

typedef struct Overlay5EventTarget {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[8];
    s32 active;
} Overlay5EventTarget;

typedef struct Overlay5RuntimeStop {
    u8 pad00[8];
    Overlay5EventTarget *target;
    u8 pad0C[4];
    Overlay5EventTarget *runtime;
    u8 pad14[0xC];
    s32 event;
} Overlay5RuntimeStop;

typedef struct Overlay5PackedStopEvent {
    Overlay5EventTarget *target;
    s16 event;
    u8 type;
    u8 priority;
} Overlay5PackedStopEvent;

void func_800DD82C(Overlay5PackedStopEvent *event);

void overlay5_runtime_event_stop(Overlay5RuntimeStop *object) {
    if (object->event != 0) {
        Overlay5PackedStopEvent event;

        event.target = object->target;
        event.target->active = 0;
        event.event = object->event;
        event.type = 2;
        event.priority = 10;
        func_800DD82C(&event);
    }
    object->runtime->flags &= ~1;
}
