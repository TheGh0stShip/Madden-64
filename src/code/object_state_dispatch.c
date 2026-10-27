#include "types.h"

typedef s32 (*ObjectTest)(void *object);
typedef void (*ObjectAction)(void *object);

typedef struct ObjectEvent {
    ObjectAction dispatch;
    u8 pad04[0x10];
    s32 type;
    s32 value;
} ObjectEvent;

typedef struct ObjectMethods {
    u8 pad00[8];
    ObjectAction prepare;
} ObjectMethods;

typedef struct ObjectStateDriver {
    ObjectTest process;
    ObjectAction close;
} ObjectStateDriver;

extern void func_80054F80(void *object);

s32 func_8005527C(u8 *object)
{
    ObjectEvent *event;
    s32 result = 0;

    switch (*(s32 *)(object + 0x10)) {
    case 0xC8:
        (*(ObjectStateDriver **)(object + 0x1B0))->close(object);
        (*(ObjectMethods **)(object + 0x14))->prepare(object);
        *(s32 *)(object + 0x10) = 0xC9;
        /* fall through */
    case 0xC9:
        result = (*(ObjectStateDriver **)(object + 0x1B0))->process(object);
        if (result == 1) {
            func_80054F80(object);
            *(s32 *)(object + 0x10) = 0xCA;
        }
        break;
    case 0xCA:
        result = 1;
        break;
    case 0xCB:
    case 0xCC:
    case 0xCD:
    case 0xCE:
    case 0xCF:
    case 0xD0:
    case 0xD2:
        result = (*(ObjectStateDriver **)(object + 0x1B0))->process(object);
        break;
    case 0xD1:
    default:
        event = *(ObjectEvent **)object;
        event->type = 0x12;
        (*(ObjectEvent **)object)->value = *(s32 *)(object + 0x10);
        (*(ObjectEvent **)object)->dispatch(object);
        break;
    }
    return result;
}
