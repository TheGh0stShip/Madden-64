#include "types.h"

typedef struct Object {
    u8 pad00[0xE];
    u8 angle_offset;
    u8 pad0F[0x5];
    u8 angle_base;
    u8 pad15[0x9];
    u8 player;
    u8 pad1F[0x9];
    u16 flags;
    u8 pad2A[0x16];
    s32 handler;
    u8 pad44[0x4];
    s16 timer;
    u8 pad4A[0x4E];
    s32 countdown;
    s32 state;
    s32 action;
} Object;

typedef struct Message {
    s8 type;
    s8 parameter;
    s8 angle;
} Message;

s32 func_800C0018(Object *, s32, s32);
s32 func_800C058C(Object *, s16, s16, s32);
s16 func_800C0EE0(Object *);
s16 func_800C157C(Object *);
s16 func_800CC238(Object *);
s32 func_800CC5C4(Object *, s16);
s32 func_800CC61C(Object *);
s32 func_800D4A74(Object *);
s32 func_800D4D1C(Object *);
s32 func_800E1A84(Object *, Message *);
s32 func_800E1C98(Object *);

extern s32 D_80080C10;
extern s16 D_80088AE4;
extern s16 D_800894FC;
extern Object *D_8008A058;
extern u16 D_8008A5B2;
extern volatile u16 D_8008A5B4;

s32 func_800D2378(Object *object) {
    Message message;
    s16 result;
    u16 flags;
    Object *call_object;
    s32 call_action;

    if (object == D_8008A058) {
        func_800CC61C(object);
        message.type = 9;
        message.parameter = 0;
        message.angle = (u16)func_800C157C(object) >> 5;
        func_800E1A84(object, &message);
        return 1;
    }

    flags = object->flags;
    if (flags & 1) {
        return 0;
    }
    if (D_800894FC != 0) {
        func_800E1C98(object);
        return 1;
    }
    if (!(flags & 8)) {
        if (D_8008A5B2 != 5) {
            message.type = 0x12;
            func_800E1A84(object, &message);
            return 1;
        }
        if (!(D_80080C10 & 8)) {
            if (object->player != D_80088AE4) {
                call_object = object;
                call_action = 0;
                goto play;
            }
        } else if (object->player != D_80088AE4) {
            message.type = 0x12;
            func_800E1A84(object, &message);
            return 1;
        }
    }

    if ((D_80080C10 & 0x48) == 0x40) {
        func_800CC61C(object);
        message.type = 0x1B;
        func_800E1A84(object, &message);
        return 1;
    }
    if (func_800C0EE0(object) == 1) {
        func_800CC61C(object);
        return 0;
    }
    if (D_8008A5B2 == 3 || object->timer != 0) {
        return 0;
    }

    result = 0;
    if (object->handler != 0) {
        result = func_800CC238(object);
    }
    if (result != 0) {
        func_800CC5C4(object, result);
        return 0;
    }

    object->countdown -= D_8008A5B4;
    if (object->countdown < 0) {
        object->countdown = ((0xFF - ((object->angle_base + object->angle_offset) >> 1)) >> 6) + 2;
        if (object->handler != 0) {
            func_800D4A74(object);
            object->state = -1;
        } else {
            func_800D4D1C(object);
        }
    }

    if (object->action >= 0) {
        s32 state = object->state;

        if (state == -1) {
            call_object = object;
            call_action = object->action;
            call_action <<= 16;
            call_action >>= 16;
play:
            func_800C0018(call_object, call_action, 0);
            return 0;
        }
        func_800C058C(object, object->action, object->action, state);
    }
    return 0;
}
