#include "types.h"

typedef struct Overlay5PreparedObject {
    u8 pad00[0x60];
    void *resource;
} Overlay5PreparedObject;

typedef struct Overlay5PreparedState {
    u8 pad00[0x14];
    s32 values[4];
} Overlay5PreparedState;

Overlay5PreparedState *func_800DD634(void);
void func_80032F3C(s32 mode, void *resource);
void func_800DD788(s32 value);
u16 func_80016FD4(void);
void func_80035F88(u16 value, s32 kind);
void func_800D628C(void *object);

void overlay5_object_runtime_prepare(Overlay5PreparedObject *object) {
    Overlay5PreparedState *state = func_800DD634();

    func_80032F3C(0, object->resource);
    state->values[0] = 0;
    state->values[1] = 0;
    state->values[2] = 0;
    state->values[3] = 0;
    func_800DD788(0x10);
    func_80035F88(func_80016FD4(), 0x48);
    func_800D628C(object);
}
