#include "types.h"

typedef void (*RenderCallback)(void);

typedef struct RenderState {
    u8 pad0[0x20];
    s32 active;
} RenderState;

typedef struct RenderOwner {
    u8 pad0[8];
    RenderState* state;
} RenderOwner;

extern void func_8000F038(void);
extern void func_80008F30(void* argument, RenderCallback callback,
                          void* owner, s32 value);

void func_8000F2CC(RenderOwner* owner, void* argument) {
    if (owner->state->active == 0) {
        func_80008F30(argument, func_8000F038, owner, 200);
    } else {
        func_80008F30(argument, func_8000F038, owner, 149);
    }
}
