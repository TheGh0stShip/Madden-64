#include "types.h"

typedef struct Overlay5UiState {
    s32 values[12];
} Overlay5UiState;

typedef struct Overlay5UiEvent {
    s32 flags;
    s32 unused;
} Overlay5UiEvent;

typedef struct Overlay5UiRegistrationArgs {
    s16 value;
    u8 pad02[2];
    Overlay5UiState *state;
    s32 unused;
    u8 pad0C[4];
    s16 kind;
} Overlay5UiRegistrationArgs;

extern u8 FIRST_RESOURCE;
extern u8 SECOND_RESOURCE;
extern void *SYSTEM;
extern void *FIRST_SYSTEM;
extern void *SECOND_SYSTEM;
void func_8003DDF8(
    void *first,
    void *second,
    Overlay5UiState *state,
    s32 value,
    s32 mode
);
void func_8003CE88(s32 first, s32 second, s32 third);
void *func_8000D740(
    void *system,
    s32 mode,
    Overlay5UiRegistrationArgs *args
);
void func_8003E460(void);
void func_80030C74(Overlay5UiEvent *event);
void func_8003E23C(Overlay5UiState *state);
void func_8000D874(void *system, void *object);
void func_8000D834(void *system, void *object);

void overlay5_ui_runtime_setup(void) {
    Overlay5UiRegistrationArgs args;
    Overlay5UiState state;
    Overlay5UiEvent event;
    Overlay5UiEvent *event_ptr;
    void *object;

    state.values[0] = 10;
    func_8003DDF8(&FIRST_RESOURCE, &SECOND_RESOURCE, &state, 150, 0);
    func_8003CE88(40, 105, 16);

    args.value = 8;
    args.state = &state;
    args.unused = 0;
    args.kind = 2;
    object = func_8000D740(SYSTEM, 1, &args);

    event_ptr = &event;
    goto check_event;
poll_event:
    func_8003E460();
    event_ptr = &event;
check_event:
    func_80030C74(event_ptr);
    if (event.flags & 2) {
        goto poll_event;
    }

    func_8003E23C(&state);
    func_8003CE88(40, 105, 16);
    func_8000D874(FIRST_SYSTEM, object);
    func_8000D834(SECOND_SYSTEM, object);
}
