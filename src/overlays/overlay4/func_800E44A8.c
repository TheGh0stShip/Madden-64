#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u16 flags;
    u8 pad2A[0x8C - 0x2A];
    s32 phase;
    u8 pad90[0x9C - 0x90];
    s32 mode;
} StateObject;

extern s32 D_80080C10;
extern u16 func_800E2BF8(void);
extern u16 func_800E2C00(void);
extern u16 func_800C0BBC(StateObject *obj, s32 mode);

u16 func_800E44A8(StateObject *obj) {
    s32 flags;

    if (obj->flags & 1) {
        obj->state->flags &= 0xFFFEFFFF;
        return func_800E2BF8();
    }
    if (obj->phase == 1) {
        if (D_80080C10 & 0x4000) {
            flags = obj->state->flags;
            if (flags & 0x20000) {
                goto done;
            }
            obj->state->flags = flags & 0xFFFEFFFF;
        }
        return func_800E2BF8();
    }
    obj->phase = func_800C0BBC(obj, obj->mode);
    if (obj->phase == 0) {
        obj->phase = 1;
        if (D_80080C10 & 0x4000) {
            obj->state->flags |= 0x10000;
        }
    } else {
        obj->phase = 0;
    }
done:
    return func_800E2C00();
}
