#include "types.h"

typedef struct Slot { u16 id; u8 value; u8 flags; } Slot;
typedef struct RowA { u16 ids[0x214C / 2]; } RowA;
typedef struct RowB { Slot slots[0x214C / 4]; } RowB;

extern s16 D_800740CA;
extern RowA D_80080CFC[];
extern RowB D_80082D84[];
extern u8 D_80087AFC;
extern u8 D_800876F4;
extern u8 D_8008B628;
extern s16 func_8003FE94(u16 value);

s32 func_8003F060(s16 team, u16 index, u8 value) {
    s16 slot;
    u16 id;

    if (D_800740CA == 0) {
        return 0;
    }
    slot = func_8003FE94(team);
    if (slot == -1) {
        return 0;
    }
    id = D_80080CFC[team].ids[index];
    D_80082D84[team].slots[slot].value = value;
    D_80082D84[team].slots[slot].flags = 0xE0;
    D_80087AFC = team;
    D_800876F4 = slot;
    D_8008B628 = index;
    D_80082D84[team].slots[slot].id = id;
    return 1;
}
