#include "types.h"

typedef struct ObjectCallbacks {
    void (*reset)(void *object);
    u8 pad04[0x10];
    s32 mode;
} ObjectCallbacks;

typedef struct DecodeState {
    u32 field00;
    void (*callback)(void);
    u32 field08;
    void *resource;
    u32 field10;
    u32 field14;
    u32 field18;
} DecodeState;

typedef struct ObjectAllocator {
    u8 pad00[0x1C];
    void *(*allocate)(void *object, u32 field08, u32 zero, u32 field10,
                      u32 one);
} ObjectAllocator;

extern void func_8005CC04(void);
extern void func_8005CCCC(void);
extern void func_8005CE00(void);

void func_8005CAC8(void *object, u32 mode)
{
    DecodeState *state =
        *(DecodeState **)((u8 *)object + 0x1AC);

    switch (mode) {
    case 0:
        if (*(u32 *)((u8 *)object + 0x54) != 0) {
            state->callback = func_8005CC04;
            if (state->resource == 0) {
                ObjectAllocator *allocator = *(ObjectAllocator **)((u8 *)object + 4);

                state->resource = allocator->allocate(
                    object, state->field08, 0, state->field10, 1);
            }
        } else {
            state->callback = *(void (**)(void))(
                *(u8 **)((u8 *)object + 0x1C0) + 4);
        }
        break;
    case 3:
        if (state->field08 == 0) {
            (*(ObjectCallbacks **)object)->mode = 4;
            (*(ObjectCallbacks **)object)->reset(object);
        }
        state->callback = func_8005CCCC;
        break;
    case 2:
        if (state->field08 == 0) {
            (*(ObjectCallbacks **)object)->mode = 4;
            (*(ObjectCallbacks **)object)->reset(object);
        }
        state->callback = func_8005CE00;
        break;
    default:
        (*(ObjectCallbacks **)object)->mode = 4;
        (*(ObjectCallbacks **)object)->reset(object);
        break;
    }
    state->field18 = 0;
    state->field14 = 0;
}
