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
} StateObject;

extern StateObject *D_8008A058;
extern s16 D_800894FC;
extern u8 D_8007483C[];
extern u8 D_80074848[];
extern u8 D_80074854[];
extern s16 func_800C1608(StateObject *obj);
extern void func_800B96C0(LinkedState *state, u8 *script);
extern void func_800E1A84(StateObject *obj, SlotEntry *entry);

s32 func_800E56D0(StateObject *obj) {
    SlotEntry entry;
    LinkedState *state;
    s32 flags;

    state = obj->state;
    flags = state->flags;
    if (flags & 0x20000) {
        return 0;
    }
    if (D_8008A058 != obj || D_800894FC != 0) {
        state->flags = flags & ~0x200;
    }
    switch (func_800C1608(obj)) {
    case 0:
    case 4:
        func_800B96C0(obj->state, D_8007483C);
        break;
    case 2:
    case 6:
        func_800B96C0(obj->state, D_80074848);
        break;
    case 1:
    case 3:
    case 5:
    case 7:
        func_800B96C0(obj->state, D_80074854);
        break;
    }
    entry.active = 6;
    func_800E1A84(obj, &entry);
    return 1;
}
