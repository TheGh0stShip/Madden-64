#include "types.h"

typedef struct Overlay5RuntimeObject {
    u8 pad0[0x14];
    u32 flags;
    u8 pad18[8];
    s32 value20;
} Overlay5RuntimeObject;

typedef struct Overlay5RuntimeState {
    u8 pad0[0x28];
    Overlay5RuntimeObject* object28;
    u8 pad2C[4];
    s32 value30;
    u8 pad34[4];
    Overlay5RuntimeObject* object38;
} Overlay5RuntimeState;

typedef struct Overlay5RuntimeEvent {
    Overlay5RuntimeObject* object;
    u16 value;
    u8 type;
    u8 amount;
} Overlay5RuntimeEvent;

extern void func_800DD82C(Overlay5RuntimeEvent* event);

void func_800D63B4(Overlay5RuntimeState* input) {
    Overlay5RuntimeState* state = input;

    if (input->value30 != 0) {
        Overlay5RuntimeEvent event;

        event.object = input->object28;
        event.object->value20 = 0;
        event.value = input->value30;
        event.type = 2;
        event.amount = 10;
        func_800DD82C(&event);
    }
    if (state->object38 != 0) {
        state->object38->flags &= ~1;
    }
}
