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
    u8 pad18[0x24 - 0x18];
    s32 busy;
} LinkedState;

typedef struct {
    u8 pad00[0x24];
    LinkedState *state;
    u8 pad28[0x64 - 0x28];
    u8 cmd[4];
    u8 pad68[0x8C - 0x68];
    s32 phase;
} StateObject;

extern u8 *D_800748C0[];
extern StateObject *D_8008A058;
extern void func_800B96C0(LinkedState *state, u8 *script);
extern u16 func_80031A1C(s32 range);
extern void func_800E1A84(StateObject *obj, SlotEntry *entry);

s32 func_800E4B5C(StateObject *obj) {
    SlotEntry entry;

    if (obj->state->busy != 0) {
        return 0;
    }
    if (obj->phase == 0) {
        switch (obj->cmd[1] >> 5) {
        case 0:
        case 4:
            func_800B96C0(obj->state, D_800748C0[0]);
            break;
        case 2:
        case 6:
            func_800B96C0(obj->state, D_800748C0[1]);
            break;
        case 1:
        case 3:
        case 5:
        case 7:
            func_800B96C0(obj->state, D_800748C0[2]);
            break;
        }
        obj->phase = 1;
    }
    if (obj->state->busy != 0) {
        return 0;
    }
    if (obj->state->flags & 0x20000) {
        return 0;
    }
    if (func_80031A1C(100) < 50 && obj != D_8008A058 && D_8008A058 != 0) {
        obj->state->flags &= ~0x200;
    }
    entry.active = 6;
    func_800E1A84(obj, &entry);
    return 1;
}
