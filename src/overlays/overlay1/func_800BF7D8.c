#include "types.h"

typedef struct {
    u8 pad00[8];
    s32 mask;
} Group;

typedef struct {
    u8 pad00[0x21];
    u8 slot;
    u8 pad22[0x6A];
    s32 unk8C;
} Actor;

extern s8 D_8008B2A8[];
extern Group *D_80072720[];
extern s32 D_80080C1C;
extern Actor *D_8008A058;

s32 func_800BD694(Actor *);
s32 func_800BD6CC(void);
void func_800BD79C(s32, s32);

s32 func_800BF7D8(Actor *actor) {
    s32 mask = func_800BD6CC();
    s32 bits = func_800BD694(actor);
    s32 slot;

    mask &= ~bits;
    if (actor != D_8008A058) {
        do {
            slot = actor->slot & 0xBF;
            if (bits & D_80072720[D_8008B2A8[slot]]->mask) {
                func_800BD79C(slot, bits);
            }
        } while (0);
    } else if (D_80080C1C & mask) {
        actor->unk8C = -actor->unk8C;
    }
    return 0;
}
