#include "types.h"

typedef void (*ObjectAction)(void *object);
typedef s32 (*ObjectTest)(void *object);

typedef struct ObjectEvent {
    ObjectAction dispatch;
    u8 pad04[0x10];
    s32 type;
} ObjectEvent;

typedef struct ObjectStreamState {
    u8 pad00[0x10];
    s32 active;
    s32 pending;
    s32 status;
} ObjectStreamState;

typedef struct ObjectMethods {
    u8 pad00[4];
    ObjectTest update;
    u8 pad08[0x4C];
    s32 notify;
} ObjectMethods;

extern void func_80056200(void *object);
extern void func_80056808(void *object);

s32 func_8005687C(u8 *object)
{
    ObjectStreamState *state;
    s32 result;

    state = *(ObjectStreamState **)(object + 0x1B0);
    if (state->pending != 0) {
        return 2;
    }

    result = (*(ObjectMethods **)(object + 0x1B4))->update(object);
    if (result == 1) {
        goto result_one;
    }
    if (result < 2) {
        goto finished;
    }
    if (result == 2) {
        goto result_two;
    }
    goto finished;

result_one:
    {
        if (state->status != 0) {
            func_80056200(object);
            state->status = 0;
        } else {
            if (state->active == 0) {
                (*(ObjectEvent **)object)->type = 0x22;
                (*(ObjectEvent **)object)->dispatch(object);
            }
            func_80056808(object);
        }
    }
    goto finished;

result_two:
    {
        state->pending = 1;
        if (state->status != 0) {
            if ((*(ObjectMethods **)(object + 0x1B4))->notify != 0) {
                (*(ObjectEvent **)object)->type = 0x3A;
                (*(ObjectEvent **)object)->dispatch(object);
            }
        } else if (*(s32 *)(object + 0x98) > *(s32 *)(object + 0x90)) {
            *(s32 *)(object + 0x98) = *(s32 *)(object + 0x90);
        }
    }

finished:
    return result;
}
