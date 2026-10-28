#include "types.h"

typedef struct Overlay5PackedEvent {
    s32 object;
    s16 value;
    u8 first;
    u8 second;
} Overlay5PackedEvent;

void func_800DD82C(Overlay5PackedEvent *event);

void overlay5_packed_event_dispatch(s32 object, s16 value, u8 first, u8 second) {
    Overlay5PackedEvent event;

    event.object = object;
    event.value = value;
    event.first = first;
    event.second = second;
    func_800DD82C(&event);
}
