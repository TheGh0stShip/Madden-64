#include "types.h"

typedef struct Overlay5LaunchState {
    u8 pad0[0x30];
    s32 values[10];
    u8 pad58[0x1C];
    void* field74;
    u8 pad78[0x14];
    void* field8C;
} Overlay5LaunchState;

typedef struct Overlay5LaunchDescriptor {
    s16 count;
    u8 pad2[2];
    s32* values;
    s32 field8;
    u8 padC[4];
    s16 mode;
} Overlay5LaunchDescriptor;

extern void* D_80086DD8;
extern u8 D_800908B8[];
extern u8 D_80072470[];
extern void func_8003CE88(s32 kind, s32 value, s32 mode);
extern void func_8003DDF8(void* input, void* global, s32* values,
                          s32 limit, s32 extra);
extern void* func_8000D740(void* object, s32 value,
                           Overlay5LaunchDescriptor* descriptor);

void func_800E10D8(Overlay5LaunchState* state, void* input) {
    Overlay5LaunchDescriptor descriptor;
    u8 index;

    if (D_80086DD8 != D_800908B8) {
        func_8003CE88(0x29, 0x69, 0x10);
    } else {
        func_8003CE88(0x23, 0x69, 0x10);
    }

    state->values[0] = 9;
    for (index = 1; index < 10; index++) {
        state->values[index] = 0;
    }

    func_8003DDF8(input, D_80072470, state->values, 0x96, 0);
    descriptor.count = 8;
    descriptor.values = state->values;
    descriptor.field8 = 0;
    descriptor.mode = 2;
    state->field8C = func_8000D740(state->field74, 1, &descriptor);
}
