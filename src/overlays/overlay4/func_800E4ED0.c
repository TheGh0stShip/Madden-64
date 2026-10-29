#include "types.h"

typedef struct {
    u8 active;
    u8 b1;
    u8 b2;
    u8 b3;
} SlotEntry;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u8 pad28[0x2D - 0x28];
    u8 kind;
    u8 pad2E[0x8C - 0x2E];
    s32 timer;
    s32 mode;
    s32 cooldown;
} StateObject;

extern u16 D_8008A5B4;
extern u8 D_80074824[];
extern s16 func_8003F16C(void);
extern void func_800C0BBC(StateObject *obj, s32 mode);
extern s32 func_8003FD94(StateObject *obj);
extern void func_800C2150(StateObject *obj, s32 arg1, s32 arg2);
extern void func_800B96C0(LinkedState *state, u8 *script);
extern void func_800E1A84(StateObject *obj, SlotEntry *entry);

s32 func_800E4ED0(StateObject *obj) {
    SlotEntry entry;

    if (func_8003F16C() != 0) {
        if (obj->kind != 0x16) {
            if (obj->mode != 0) {
                obj->state->flags &= 0xFFFEFFFF;
                func_800C0BBC(obj, obj->mode);
                obj->state->flags |= 0x10000;
            } else {
                obj->mode = func_8003FD94(obj);
            }
        }
        obj->cooldown -= D_8008A5B4;
        if (obj->cooldown < 0) {
            obj->cooldown += 0x22;
            func_800C2150(obj, 0x7F, 6);
            return 0;
        }
        return 0;
    }
    obj->timer -= D_8008A5B4;
    if (obj->timer < 0) {
        obj->state->flags &= 0xFFFEFFFF;
        if (obj->state->flags & 0x100000) {
            func_800C0BBC(obj, 0xD0004);
        } else {
            func_800C0BBC(obj, 0xE0017);
        }
        func_800B96C0(obj->state, D_80074824);
        obj->state->flags |= 0x10200;
        entry.active = 7;
        func_800E1A84(obj, &entry);
        return 1;
    }
    return 0;
}
