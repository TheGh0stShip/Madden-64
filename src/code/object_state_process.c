#include "types.h"

typedef s32 (*ObjectTest)(void *object);
typedef void (*ObjectAction)(void *object);

typedef struct ObjectEvent {
    ObjectAction dispatch;
    u8 pad04[0x10];
    s32 type;
    s32 value;
} ObjectEvent;

typedef struct ObjectChild {
    ObjectAction update;
    s32 position;
    s32 limit;
} ObjectChild;

typedef struct ObjectStateDriver {
    ObjectTest process;
    u8 pad04[0xC];
    s32 active;
} ObjectStateDriver;

extern void func_8005619C(void);
extern s32 func_800548B8(void *object);

s32 func_80054768(u8 *object)
{
    ObjectChild *child;
    ObjectStateDriver *driver;
    ObjectEvent *event;
    s32 result;

    if (*(s32 *)(object + 0x10) == 0xCA) {
        func_8005619C();
        __asm__("" ::: "memory");
        if (*(s32 *)(object + 0x40) != 0) {
            *(s32 *)(object + 0x10) = 0xCF;
            return 1;
        }
        *(s32 *)(object + 0x10) = 0xCB;
    }

    if (*(s32 *)(object + 0x10) == 0xCB) {
        driver = *(ObjectStateDriver **)(object + 0x1B0);
        if (driver->active != 0) {
            do {
                if (*(ObjectChild **)(object + 8) != 0) {
                    (*(ObjectChild **)(object + 8))->update(object);
                }
retry_driver:
                result = (*(ObjectStateDriver **)(object + 0x1B0))->process(object);
                if (result == 0) {
                    return 0;
                }
                if (result == 2) {
                    break;
                }
                child = *(ObjectChild **)(object + 8);
                if (child == 0) {
                    goto retry_driver;
                }
                if (result == 3 || result == 1) {
                    result = child->position + 1;
                    child->position = result;
                    child = *(ObjectChild **)(object + 8);
                    if (result >= child->limit) {
                        child->limit += *(s32 *)(object + 0x13C);
                    }
                }
            } while (1);
        }
        *(s32 *)(object + 0x98) = *(s32 *)(object + 0x90);
    } else if (*(s32 *)(object + 0x10) != 0xCC) {
        event = *(ObjectEvent **)object;
        event->type = 0x12;
        (*(ObjectEvent **)object)->value = *(s32 *)(object + 0x10);
        (*(ObjectEvent **)object)->dispatch(object);
    }
    return func_800548B8(object);
}
