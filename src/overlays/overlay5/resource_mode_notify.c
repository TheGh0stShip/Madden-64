#include "types.h"

extern void *D_80086DD8;
extern u8 D_800908B8[];

void func_8003CE88(s32 event, s32 value, s32 width);

#ifndef EVENT_EQUAL
#define EVENT_EQUAL 0x21
#endif

#ifndef EVENT_OTHER
#define EVENT_OTHER 0x27
#endif

void overlay5_resource_mode_notify(void) {
    if (D_80086DD8 != D_800908B8) {
        func_8003CE88(EVENT_OTHER, 0x69, 0x10);
    } else {
        func_8003CE88(EVENT_EQUAL, 0x69, 0x10);
    }
}
