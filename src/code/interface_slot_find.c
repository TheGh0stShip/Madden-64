#include "types.h"

typedef struct InterfaceSlot {
    u16 value;
    u16 pad2;
} InterfaceSlot;

typedef struct InterfaceSlotGroup {
    InterfaceSlot slots[4];
    u8 pad10[0x213C];
} InterfaceSlotGroup;

extern InterfaceSlotGroup D_80082D84[];

s32 func_8003FE94(u16 owner) {
    s16 index;

    for (index = 0; index < 4; index++) {
        if (D_80082D84[owner].slots[index].value == 0xFFFF) {
            return index;
        }
    }
    return -1;
}
