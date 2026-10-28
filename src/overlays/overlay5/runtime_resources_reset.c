#include "types.h"

typedef struct Overlay5ResetObject {
    u8 pad00[0x3C];
    void *resource;
} Overlay5ResetObject;

typedef struct Overlay5ResetState {
    u8 pad00[0x40];
    s32 slots[11];
} Overlay5ResetState;

extern void *RESOURCE_A;
extern void *RESOURCE_B;
extern void *RESOURCE_C;
extern void *RESOURCE_D;

void func_800D5D28(Overlay5ResetObject *object);
Overlay5ResetState *func_800DD634(void);
void func_8000BE80(void);
void func_8000DA98(void *resource);
void func_80017010(void *resource, s32 value);

void overlay5_runtime_resources_reset(Overlay5ResetObject *object) {
    Overlay5ResetState *state;
    s8 index;

    func_800D5D28(object);
    state = func_800DD634();
    index = 1;
    do {
        state->slots[index] = 0;
        index++;
    } while (index < 11);
    func_8000BE80();
    func_8000DA98(object->resource);
    func_80017010(RESOURCE_A, 0);
    func_80017010(RESOURCE_B, 0);
    func_80017010(RESOURCE_C, 0);
    func_80017010(RESOURCE_D, 0);
}
