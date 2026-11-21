#include "types.h"

typedef struct {
    u8 pad00[0x14];
    s32 flags;
    u8 pad18[0x24 - 0x18];
    s32 unk_24;
    u8 pad28[0x2C - 0x28];
    u8 unk_2C[1];
} LinkedState;

typedef struct {
    u8 pad00[0x2D];
    u8 kind;
} PlayerInfo;

typedef struct StateObject {
    u8 pad00[0x24];
    LinkedState *state;
    u16 flags;
    u8 pad2A[0x30 - 0x2A];
    s16 unk_30;
    u8 pad32[0x34 - 0x32];
    s16 unk_34;
    s16 unk_36;
    PlayerInfo *info;
} StateObject;

extern StateObject *D_8008A058;

extern void func_8003EE10(StateObject *obj);
extern s16 func_800B9208(u8 *arg0);
extern void func_800C0BBC(StateObject *obj, s32 mode);
extern u16 func_800C0D00(StateObject *obj, s32 arg1);
extern void func_800C11EC(StateObject *obj, s32 arg1);
extern void func_800C1230(StateObject *obj, s32 arg1);
extern s16 func_800C157C(StateObject *obj);
extern void func_800C16A0(StateObject *obj, s16 angle);
extern void func_800C1A64(StateObject *obj, LinkedState *state);
extern void func_800C1B5C(StateObject *obj);
extern void func_800C2150(StateObject *obj, u8 arg1, u8 arg2);

s32 func_800E525C(StateObject *obj) {
    s16 angle;
    s32 mode;
    s32 done;
    s32 value;
    LinkedState *state;

    obj->unk_34 = 8;
    obj->unk_36 = 0;
    obj->state->flags &= 0xFFFEFFFF;
    done = 0;
    obj->flags |= 0x10;
    angle = func_800B9208(obj->state->unk_2C);
    switch ((((s16) (angle - func_800C157C(obj))) + 0x2FF) >> 9 & 7) {
        case 0:
        case 1:
        case 2:
            if (obj->flags & 8) {
                mode = 0x30001A;
                if (obj->unk_30 >= 0x15) {
                    if (obj->state->unk_24 > 0x50000) {
                        if (func_800C0D00(obj, 0x12)) {
                            done = 1;
                            obj->unk_30 *= 2;
                            func_800C11EC(obj, 0x1E);
                            func_8003EE10(obj);
                        }
                    } else {
                        if ((obj->info->kind == 0x1A || (obj->unk_30 >= 0x42 && obj == D_8008A058)) &&
                            func_800C0D00(obj, 0x1B)) {
                            done = 1;
                            obj->unk_30 *= 2;
                            func_800C11EC(obj, 0x1E);
                        }
                        if (done == 0 && func_800C0D00(obj, 0x13)) {
                            done = 1;
                            obj->unk_30 *= 2;
                            func_800C11EC(obj, 0x1E);
                        }
                    }
                }
                if (obj->unk_30 >= 0x29) {
                    func_800C1230(obj, obj->unk_30 >> 2);
                }
            } else {
                mode = 0x300020;
                if (obj->unk_30 >= 0x29) {
                    func_800C1230(obj, obj->unk_30 >> 2);
                }
            }
            break;
        case 7:
            func_800C16A0(obj, angle);
            mode = 0x290027;
            if ((obj->flags & 8) && obj->unk_30 >= 0x15) {
                if (func_800C0D00(obj, 0x29)) {
                    done = 1;
                }
            }
            break;
        case 3:
            func_800C16A0(obj, angle);
            mode = 0x2A0028;
            if ((obj->flags & 8) && obj->unk_30 >= 0x15) {
                if (func_800C0D00(obj, 0x2A)) {
                    done = 1;
                }
            }
            break;
        default:
            if (obj->flags & 8) {
                mode = 0x31001B;
                if (obj->unk_30 >= 0x15) {
                    if (obj->state->unk_24 > 0x50000) {
                        if (func_800C0D00(obj, 0x10)) {
                            done = 1;
                            obj->unk_30 *= 2;
                            func_800C11EC(obj, 0x1E);
                            func_8003EE10(obj);
                        }
                    } else {
                        if ((obj->info->kind == 0x1A || (obj->unk_30 >= 0x42 && obj == D_8008A058)) &&
                            func_800C0D00(obj, 0x1C)) {
                            done = 1;
                            obj->unk_30 *= 2;
                            func_800C11EC(obj, 0x1E);
                        }
                        if (done == 0 && func_800C0D00(obj, 0x11)) {
                            done = 1;
                            obj->unk_30 *= 2;
                            func_800C11EC(obj, 0x1E);
                        }
                    }
                }
                if (obj->unk_30 >= 0x24) {
                    func_800C1230(obj, obj->unk_30 >> 2);
                }
            } else {
                mode = 0x310021;
                if (obj->unk_30 >= 0x24) {
                    func_800C1230(obj, obj->unk_30 >> 2);
                }
            }
            break;
    }
    if (done == 0) {
        func_800C0BBC(obj, mode);
    }
    state = obj->state;
    state->flags |= 0x10000;
    func_800C1A64(obj, state);
    func_800C1B5C(obj);
    value = obj->unk_30;
    if (value > 100) {
        value = 100;
    }
    func_800C2150(obj, value / 2 + 0x3C, value / 10 + 6);
    if (obj->unk_30 != 0 && obj == D_8008A058 && obj->state->unk_24 != 0) {
        obj->unk_30 += 0x1E;
    }
    return 0;
}
