#include "types.h"

typedef struct Overlay5ToggleObject {
    u8 pad00[0x44];
    u16 direction;
    u8 pad46[0xA];
    u16 enabled;
    u8 pad52[8];
    u16 timer;
} Overlay5ToggleObject;

void overlay5_object_flags_toggle(Overlay5ToggleObject *object) {
    object->timer = 0;
    object->enabled ^= 1;
    object->direction = ~object->direction + 1;
}
