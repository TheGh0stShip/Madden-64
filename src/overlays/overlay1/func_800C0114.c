#include "types.h"

typedef struct {
    u8 unk00[0x21];
    u8 slot;
    u8 unk22[6];
    u16 flags;
} Actor;

extern s32 D_80080C10;
extern s32 D_800878A8[];
extern s32 D_80089380[];

void func_800C0114(Actor *actor) {
    s32 slot;
    s32 *seen;
    s32 bits;
    u16 flags;

    slot = actor->slot & 0x3F;
    if (!(D_80080C10 & 0x01000000)) {
        seen = &D_80089380[slot];
        bits = D_800878A8[slot];
        if (bits & (~*seen | 0xF00) & 0xEF3F) {
            flags = actor->flags | 1;
        } else {
            *seen = bits;
            return;
        }
    } else {
        flags = actor->flags & ~1;
    }
    actor->flags = flags;
}
