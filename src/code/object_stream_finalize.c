#include "types.h"

typedef s32 (*ObjectTest)(void *object);
typedef void (*ObjectAction)(void *object);
typedef void (*VoidAction)(void);

typedef struct ObjectEvent {
    ObjectAction dispatch;
    u8 pad04[0x10];
    s32 type;
    s32 value;
} ObjectEvent;

typedef struct ObjectMethods {
    u8 pad00[0x18];
    ObjectAction finish;
} ObjectMethods;

typedef struct ObjectStreamDriver {
    ObjectTest process;
    u8 pad04[0x10];
    s32 finished;
} ObjectStreamDriver;

typedef struct ObjectOutput {
    u8 pad00[4];
    ObjectAction close;
} ObjectOutput;

extern void func_80063318(void *object);

s32 func_80055444(u8 *object)
{
    ObjectEvent *event;
    ObjectStreamDriver *driver;
    s32 state;

    state = *(s32 *)(object + 0x10);
    if ((u32)(state - 0xCD) < 2 && *(s32 *)(object + 0x40) == 0) {
        if (*(u32 *)(object + 0x8C) < *(u32 *)(object + 0x74)) {
            event = *(ObjectEvent **)object;
            event->type = 0x42;
            ((VoidAction)(*(ObjectEvent **)object)->dispatch)();
        }
        (*(ObjectOutput **)(object + 0x1A0))->close(object);
        *(s32 *)(object + 0x10) = 0xD2;
    } else if (*(s32 *)(object + 0x10) == 0xCF) {
        *(s32 *)(object + 0x10) = 0xD2;
    } else if (*(s32 *)(object + 0x10) != 0xD2) {
        event = *(ObjectEvent **)object;
        event->type = 0x12;
        (*(ObjectEvent **)object)->value = *(s32 *)(object + 0x10);
        (*(ObjectEvent **)object)->dispatch(object);
    }

    while ((driver = *(ObjectStreamDriver **)(object + 0x1B0))->finished == 0) {
        if (driver->process(object) == 0) {
            return 0;
        }
    }
    (*(ObjectMethods **)(object + 0x14))->finish(object);
    func_80063318(object);
    return 1;
}
