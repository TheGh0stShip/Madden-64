#include "types.h"

typedef struct TextureState {
    u8 pad00[4];
    void *resource;
    u8 pad08[0x0C];
    u16 first;
    u16 second;
    u8 pad18[0x90];
    u16 flags;
} TextureState;

typedef struct TextureOwner {
    u8 pad00[8];
    TextureState *state;
} TextureOwner;

extern u8 D_80087A94;
extern u16 *func_80011248(void);
extern void func_8000E7F4(void *resource);
extern void func_8000E954(void *resource);

void object_texture_state_refresh(TextureOwner *owner)
{
    TextureState *state = owner->state;
    u16 *values;

    if (D_80087A94 != 0) {
        values = func_80011248();
        if (!(state->flags & 0x10)) {
            func_8000E7F4(state->resource);
            state->flags |= 0x10;
        }
        if (values != 0) {
            state->first = values[0];
            state->second = values[1];
        }
    } else if (state->flags & 0x10) {
        func_8000E954(state->resource);
        state->first = 0;
        state->flags &= ~0x10;
    }
}
