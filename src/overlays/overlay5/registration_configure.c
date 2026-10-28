#include "types.h"

typedef struct Overlay5ConfiguredRegistration {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[8];
    s32 timing;
} Overlay5ConfiguredRegistration;

typedef struct Overlay5RegistrationConfig {
    s16 value;
    u8 pad02[2];
    s32 first;
    s32 second;
    u8 pad0C[4];
    s16 kind;
} Overlay5RegistrationConfig;

typedef struct Overlay5ConfiguredState {
    u8 pad00[0x1C];
    s32 first;
    s32 second;
} Overlay5ConfiguredState;

extern void *SYSTEM;
extern void CALLBACK(void);
Overlay5ConfiguredRegistration *func_8000D740(
    void *system,
    s32 mode,
    Overlay5RegistrationConfig *config
);
void func_800DF150(
    void *object,
    void (*callback)(void),
    Overlay5ConfiguredRegistration *registration,
    s32 mode
);
Overlay5ConfiguredState *func_800DD634(void);

Overlay5ConfiguredRegistration *overlay5_registration_configure(
    s16 value,
    void *object
) {
    Overlay5RegistrationConfig config;
    Overlay5ConfiguredRegistration *registration;
    Overlay5ConfiguredState *state;

    config.value = value;
    config.first = 0;
    config.second = 0;
    config.kind = 6;
    registration = func_8000D740(SYSTEM, 1, &config);
    registration->timing = 0x140;
    registration->flags &= ~1;
    func_800DF150(object, CALLBACK, registration, 0);
    state = func_800DD634();
    state->first = 0;
    state->second = 0;
    return registration;
}
