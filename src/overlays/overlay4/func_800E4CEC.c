#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x24 - 0x18];
    s32 busy;
    u8 pad28[0x2C - 0x28];
    s32 velX;
    s32 velY;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u16 flags;
    u8 pad2A[0x8C - 0x2A];
    s32 phase;
    s32 target;
} StateObject;

extern u8 D_80074824[];
extern s16 func_800C157C(StateObject *obj);
extern void func_800C0AE4(StateObject *obj, s16 angle, s32 arg2);
extern void func_800C0B64(StateObject *obj, s32 arg1);
extern void func_800B96C0(LinkedState *state, u8 *script);

s32 func_800E4CEC(StateObject *obj) {
    LinkedState *state;

    if (obj->phase == 0) {
        state = obj->state;
        if (state->flags & 0x40000) {
            state->velX -= state->velX / 4;
            state = obj->state;
            state->velY -= state->velY / 4;
            if (obj->target != 0) {
                func_800C0AE4(obj, func_800C157C(obj), 0);
            }
            func_800C0B64(obj, 0);
            obj->phase = 1;
        }
        return 0;
    }
    if (obj->state->busy != 0) {
        return 0;
    }
    obj->flags &= 0xFFEF;
    obj->state->flags &= 0xFFFEFFFF;
    func_800B96C0(obj->state, D_80074824);
    return 1;
}
