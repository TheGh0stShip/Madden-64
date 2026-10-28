#include "types.h"

typedef struct Overlay5ConstructRegistration {
    u8 pad00[0x20];
    void *event;
} Overlay5ConstructRegistration;

typedef struct Overlay5ConstructConfig {
    u8 pad00[4];
    Overlay5ConstructRegistration *registration;
} Overlay5ConstructConfig;

typedef struct Overlay5ConstructObject {
    void *runtime;
    s32 state;
    Overlay5ConstructRegistration *registration;
    u8 pad0C[4];
    Overlay5ConstructRegistration *secondary;
    u8 pad14[4];
    s32 secondary_value;
    u8 pad1C[4];
    void *event;
    u8 pad24[0x50];
    s32 entry_count;
    void *entries[181];
} Overlay5ConstructObject;

typedef struct Overlay5ConstructArgs {
    s16 value;
    u8 pad02[2];
    void *entries;
    s32 unused;
    u8 pad0C[4];
    s16 kind;
} Overlay5ConstructArgs;

typedef struct Overlay5ConstructEvent {
    Overlay5ConstructRegistration *registration;
    s16 value;
    u8 type;
    u8 priority;
} Overlay5ConstructEvent;

extern void *SYSTEM;
Overlay5ConstructRegistration *func_8000D740(
    void *system,
    s32 mode,
    Overlay5ConstructArgs *args
);
void func_800DD7E8(Overlay5ConstructEvent *event);
void *func_800E06C4(s32 mode, Overlay5ConstructConfig *config);
void func_800E08A4(void *runtime);
Overlay5ConstructRegistration *func_800D5F78(s32 value, void *runtime);

void *overlay5_runtime_object_construct(
    s32 value,
    Overlay5ConstructObject *object,
    Overlay5ConstructConfig *config
) {
    Overlay5ConstructArgs args;
    Overlay5ConstructEvent event;
    Overlay5ConstructRegistration *registration;
    void *runtime;
    s32 *entry_base;
    u8 index;

    entry_base = &object->entry_count;
    object->entry_count = 181;
    index = 0;
    while (index < 180) {
        entry_base[index + 1] = 0;
        index++;
    }
    entry_base[index + 1] = 0;

    args.value = value;
    args.entries = entry_base;
    args.unused = 0;
    args.kind = 7;
    registration = func_8000D740(SYSTEM, 1, &args);
    config->registration = registration;
    object->registration = registration;

    if (object->event != 0) {
        event.registration = config->registration;
        event.registration->event = object->event;
        event.value = 0;
        event.type = 3;
        event.priority = 10;
        func_800DD7E8(&event);
    }

    runtime = func_800E06C4(0, config);
    object->runtime = runtime;
    func_800E08A4(runtime);
    object->secondary = func_800D5F78(object->secondary_value, runtime);
    object->state = 0;
    return runtime;
}
