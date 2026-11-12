#include "types.h"

typedef struct {
    u8 first;
    u8 second;
    u8 pad02[2];
    u8 state;
} Slot;

typedef struct {
    u8 values[9];
} ValueMap;

extern s16 D_800892B4;
extern s16 D_800892B6;
extern s16 D_80087A92;
extern s16 D_8008A5B0;

Slot *func_8009D69C(s32, s32);
void func_80024F5C(void);

void func_8009DA78(s32 team, s32 index) {
    ValueMap map = { "\x05\x0A\x00\x08\x0B\x0D\x0E\x11\x1C" };
    Slot *slot = func_8009D69C(team, index);
    u8 second;
    s32 first;
    volatile u8 *base;

    do {
        second = slot->second;
        slot->state = 1;
        D_800892B4 = second;
    } while (0);
    D_800892B6 = slot->first;
    first = slot->first;
    base = map.values;
    D_80087A92 = base[first];
    func_80024F5C();
    D_8008A5B0 = 6;
}
