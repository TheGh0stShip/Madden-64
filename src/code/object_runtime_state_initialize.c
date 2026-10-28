#include "types.h"

typedef struct ObjectEvent {
    void (*dispatch)(void *object);
    u8 pad04[0x10];
    s32 type;
    s32 expected;
    s32 actual;
} ObjectEvent;

extern void func_8002E58C(void *pointer, s32 value, u32 size);
extern void func_800647F0(void *object);
extern void func_80058CB0(void *object);
extern void func_80056A08(void *object);

void func_80054DB0(u8 *object, s32 kind, s32 size)
{
    void *saved_event;
    ObjectEvent *event;
    s32 *cursor;
    volatile s32 *forward;
    s32 index;

    *(s32 *)(object + 4) = 0;
    if (kind != 0x3D) {
        event = *(ObjectEvent **)object;
        event->type = 0xA;
        (*(ObjectEvent **)object)->expected = 0x3D;
        (*(ObjectEvent **)object)->actual = kind;
        (*(ObjectEvent **)object)->dispatch(object);
    }
    if (size != 0x1D0) {
        event = *(ObjectEvent **)object;
        event->type = 0x13;
        (*(ObjectEvent **)object)->expected = 0x1D0;
        (*(ObjectEvent **)object)->actual = size;
        (*(ObjectEvent **)object)->dispatch(object);
    }
    saved_event = *(void **)object;
    func_8002E58C(object, 0, 0x1D0);
    *(s32 *)(object + 0xC) = 1;
    *(void **)object = saved_event;
    func_800647F0(object);
    *(s32 *)(object + 8) = 0;
    *(s32 *)(object + 0x14) = 0;
    index = 3;
    cursor = (s32 *)(object + 0xC);
    do {
        cursor[0x29] = 0;
        index--;
        cursor--;
    } while (index >= 0);
    index = 0;
    forward = (s32 *)object;
    do {
        forward[0x2D] = 0;
        forward[0x31] = 0;
        forward++;
        index++;
    } while (index < 4);
    func_80058CB0(object);
    func_80056A08(object);
    *(s32 *)(object + 0x10) = 0xC8;
}
