#include "types.h"

typedef s32 (*ObjectCallback)(void *object);
typedef s32 (*ObjectCallbackArg)(void *object, s32 value);

typedef struct ObjectEvent {
    ObjectCallback dispatch;
    ObjectCallbackArg dispatch_arg;
    u8 pad08[0xC];
    s32 type;
    s32 value;
} ObjectEvent;

typedef struct ObjectChild {
    ObjectCallback update;
    s32 position;
    s32 limit;
} ObjectChild;

typedef struct ObjectDriver {
    u8 pad00[0xC];
    ObjectCallbackArg step;
} ObjectDriver;

s32 func_80054AEC(u8 *object, s32 value, u32 amount)
{
    ObjectEvent *event;
    ObjectChild *child;
    s32 step;

    if (*(s32 *)(object + 0x10) != 0xCE) {
        event = *(ObjectEvent **)object;
        event->type = 0x12;
        (*(ObjectEvent **)object)->value = *(s32 *)(object + 0x10);
        (*(ObjectEvent **)object)->dispatch(object);
    }

    if (*(u32 *)(object + 0x8C) >= *(u32 *)(object + 0x74)) {
        event = *(ObjectEvent **)object;
        event->type = 0x77;
        (*(ObjectEvent **)object)->dispatch_arg(object, -1);
        return 0;
    }

    child = *(ObjectChild **)(object + 8);
    if (child != 0) {
        child->position = *(s32 *)(object + 0x8C);
        (*(ObjectChild **)(object + 8))->limit = *(s32 *)(object + 0x74);
        (*(ObjectChild **)(object + 8))->update(object);
    }

    step = *(s32 *)(object + 0x134) * *(s32 *)(object + 0x138);
    if (amount < (u32)step) {
        event = *(ObjectEvent **)object;
        event->type = 0x15;
        (*(ObjectEvent **)object)->dispatch(object);
    }

    if ((*(ObjectDriver **)(object + 0x1A8))->step(object, value) == 0) {
        __asm__("" ::: "memory");
        return 0;
    }
    *(s32 *)(object + 0x8C) += step;
    return step;
}
