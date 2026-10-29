#include "types.h"

typedef struct {
    u8 pad00[0xD];
    u8 level;
    u8 pad0E[3];
    u8 base;
} Gauge;

typedef struct {
    u8 pad00[0x14];
    s32 flags;
} Owner;

void func_800BA9A4(u16 amount, Gauge *gauge, Owner *owner) {
    if (amount == 0) {
        owner->flags &= ~1;
    } else {
        if (amount < 5) {
            amount = 5;
        }
        gauge->level = gauge->base - amount / 5;
        owner->flags |= 1;
    }
}
