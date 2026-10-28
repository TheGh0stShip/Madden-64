#include "types.h"

extern u16 FAST_MODE;

typedef struct Overlay5TimedObject {
    u8 pad00[0x20];
    s32 timing;
} Overlay5TimedObject;

void overlay5_object_timing_set(Overlay5TimedObject *object, u8 index) {
    if (FAST_MODE) {
        object->timing = index * 13 + 160;
    } else {
        object->timing = 244;
    }
}
