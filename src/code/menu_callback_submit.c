#include "types.h"

typedef void (*MenuCallback)(void);

typedef struct MenuState {
    u8 pad0[0x30];
    u32 flags;
    u8 pad34[6];
    s16 value;
} MenuState;

typedef struct MenuOwner {
    u8 pad0[8];
    MenuState* state;
} MenuOwner;

extern void func_800180A8(void);
extern void func_80018540(void);
extern void func_80008F30(void* argument, MenuCallback callback,
                          void* owner, s32 value);

void func_80018050(MenuOwner* owner, void* argument) {
    if (owner->state->flags & 0x8000) {
        func_80008F30(argument, func_800180A8, owner, owner->state->value);
    } else {
        func_80008F30(argument, func_80018540, owner, owner->state->value);
    }
}
