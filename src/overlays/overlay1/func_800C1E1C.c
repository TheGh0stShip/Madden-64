#include "types.h"

typedef struct {
    u8 kind;
    u8 value;
} Event;

void func_800E1A84(s32, Event *);

void func_800C1E1C(s32 target, s16 value) {
    Event event;
    u8 v;

    event.kind = 0xE;
    v = value;
    if (value < 0) {
        v = 0xFF;
    }
    event.value = v;
    func_800E1A84(target, &event);
}
