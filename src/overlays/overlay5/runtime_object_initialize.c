#include "types.h"

typedef struct Overlay5InitializableObject {
    u8 pad00[8];
    void *handle;
} Overlay5InitializableObject;

typedef struct Overlay5InitializationState {
    u8 pad00[0x14];
    s32 value14;
    s32 value18;
    u8 pad1C[0x24];
    s32 value40;
    s32 value44;
} Overlay5InitializationState;

extern void *FIRST_SYSTEM;
extern void *SECOND_SYSTEM;
void func_800D628C(void *object);
void func_800DD788(s32 value);
void func_800D57CC(void);
void func_8000D874(void *system, void *handle);
void func_8000D834(void *system, void *handle);
Overlay5InitializationState *func_800DD634(void);

void overlay5_runtime_object_initialize(Overlay5InitializableObject *object) {
    Overlay5InitializationState *state;

    func_800D628C(object);
    func_800DD788(0x11);
    func_800D57CC();
    func_8000D874(FIRST_SYSTEM, object->handle);
    func_8000D834(SECOND_SYSTEM, object->handle);
    state = func_800DD634();
    state->value14 = 0;
    state->value18 = 0;
    state->value40 = 0;
    state->value44 = 0;
}
