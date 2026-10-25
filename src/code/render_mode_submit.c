#include "types.h"

typedef void (*RenderCallback)(void);

typedef struct RenderModeState {
    u8 pad0[8];
    u8 mode;
} RenderModeState;

typedef struct RenderModeOwner {
    u8 pad0[8];
    RenderModeState* state;
} RenderModeOwner;

extern void func_8000F934(void);
extern void func_80008F30(void* argument, RenderCallback callback,
                          void* owner, s32 value);

void func_8000F8EC(RenderModeOwner* owner, void* argument) {
    u8 value = owner->state->mode & 0xF;

    func_80008F30(argument, func_8000F934, owner,
                  value == 0 ? 0xFF : 0x4B);
}
