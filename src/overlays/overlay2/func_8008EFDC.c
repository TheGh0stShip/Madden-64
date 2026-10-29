#include "types.h"

typedef struct {
    u8 id;
    u8 link;
    u8 unk2;
    u8 unk3;
    u8 flags;
    s8 state;
} Slot;

Slot *func_8008DC10(s16, s16);

s16 func_8008EFDC(s16 group) {
    s16 count = 0;
    s16 i;
    Slot *slot;

    for (i = 0; i < 15; i++) {
        slot = func_8008DC10(group, i);
        if (slot->id != 0xFF) {
            if (slot->state == 1) {
                if (!(slot->flags & 0xF)) {
                    count++;
                }
            }
        }
    }
    return count;
}
