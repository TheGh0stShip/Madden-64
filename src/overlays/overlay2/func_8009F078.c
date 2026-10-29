#include "types.h"

typedef struct {
    u16 ids[16];
    s16 flags[16];
    u16 selected;
} SlotTable;

extern s8 D_800C4EEB;

u16 func_80031A1C(u16);

s32 func_8009F078(SlotTable *slots) {
    s16 all;
    u16 i;
    u16 pick;

    all = 1;
    for (i = 0; i < (u16)D_800C4EEB; i++) {
        if (slots->flags[i] == 0) {
            all = 0;
            break;
        }
    }
    if (all == 0) {
        pick = func_80031A1C(D_800C4EEB);
        while (slots->flags[pick] == 1) {
            pick = func_80031A1C(D_800C4EEB);
        }
        slots->selected = pick;
    }
    return all;
}
