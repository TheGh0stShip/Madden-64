#include "types.h"

typedef struct Overlay5RegistrationArgs {
    s16 value;
    u8 pad02[2];
    s32 first;
    s32 second;
    u8 pad0C[4];
    s16 kind;
} Overlay5RegistrationArgs;

typedef struct Overlay5Registration {
    u8 pad00[0x14];
    s32 flags;
} Overlay5Registration;

extern void *SYSTEM;
Overlay5Registration *func_8000D740(
    void *system,
    s32 mode,
    Overlay5RegistrationArgs *args
);

void overlay5_registration_create(s16 value) {
    Overlay5RegistrationArgs args;
    Overlay5Registration *registration;

    args.value = value;
    args.first = 0;
    args.second = 0;
    args.kind = 6;
    registration = func_8000D740(SYSTEM, 1, &args);
    registration->flags &= ~1;
}
