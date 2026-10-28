#include "types.h"

typedef struct Overlay5DispatchRuntime {
    u8 pad00[0x14];
    s32 flags;
} Overlay5DispatchRuntime;

typedef struct Overlay5DispatchObject {
    u8 pad00[0x38];
    Overlay5DispatchRuntime *runtime;
} Overlay5DispatchObject;

extern u8 RESOURCE;
void func_800D049C(
    Overlay5DispatchRuntime *runtime,
    u8 kind,
    Overlay5DispatchObject *object
);
void func_800DF72C(void);
void func_800DE84C(void *resource);
void func_800DD4B8(void);
void func_800D63B4(Overlay5DispatchObject *object);

void overlay5_object_resource_dispatch(
    Overlay5DispatchObject *object,
    s32 unused,
    s16 state
) {
    switch (state) {
        case 13:
            func_800D049C(object->runtime, 0, object);
            object->runtime->flags |= 1;
            break;

        case 8:
        case 28:
            func_800DF72C();
            func_800DE84C(&RESOURCE);
            func_800DD4B8();
            break;

        case 12:
            func_800D63B4(object);
            break;
    }
}
