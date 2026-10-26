#include "types.h"

typedef struct ObjectDecodeOwner ObjectDecodeOwner;
typedef struct ObjectDecodeOps {
    void *(*allocate)(ObjectDecodeOwner *, s32, s32);
    u8 pad04[4];
    void *(*alternate)(ObjectDecodeOwner *, s32, s32);
    u8 pad0C[4];
    void *(*primary)(ObjectDecodeOwner *, s32, s32, s32, void *, s32);
} ObjectDecodeOps;

typedef struct ObjectDecodeState {
    void *callback;
    u8 pad04[4];
    void *primary;
    void *alternate;
    s32 count;
} ObjectDecodeState;

struct ObjectDecodeOwner {
    u8 pad00[4];
    ObjectDecodeOps *ops;
    u8 pad08[0x4C];
    s32 enabled;
    u8 pad58[0x18];
    s32 rows;
    void *source;
    s32 columns;
    u8 pad7C[0xB8];
    s32 count;
    u8 pad138[0x74];
    ObjectDecodeState *state;
};

extern void func_8005CAC8(void);
extern void *func_80063214(void *, s32);

void object_decode_state_create(ObjectDecodeOwner *owner, s32 primary)
{
    ObjectDecodeState *state = owner->ops->allocate(owner, 1, 0x1C);

    owner->state = state;
    state->callback = func_8005CAC8;
    state->primary = 0;
    state->alternate = 0;
    if (owner->enabled != 0) {
        register s32 count __asm__("$7") = owner->count;

        state->count = count;
        if (primary != 0) {
            void *source = func_80063214(owner->source, count);
            state->primary = owner->ops->primary(
                owner, 1, 0, owner->rows * owner->columns, source, state->count);
        } else {
            state->alternate = owner->ops->alternate(
                owner, 1, owner->rows * owner->columns);
        }
    }
}
