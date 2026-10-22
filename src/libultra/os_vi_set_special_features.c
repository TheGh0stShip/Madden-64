#include "os_internal.h"

void osViSetSpecialFeatures(u32 features) {
    register u32 mask;

    mask = __osDisableInt();
    if (features & 0x01) {
        D_80074EA4->control |= 0x08;
    }
    if (features & 0x02) {
        D_80074EA4->control &= ~0x08;
    }
    if (features & 0x04) {
        D_80074EA4->control |= 0x04;
    }
    if (features & 0x08) {
        D_80074EA4->control &= ~0x04;
    }
    if (features & 0x10) {
        D_80074EA4->control |= 0x10;
    }
    if (features & 0x20) {
        D_80074EA4->control &= ~0x10;
    }
    if (features & 0x40) {
        D_80074EA4->control |= 0x10000;
        D_80074EA4->control &= ~0x300;
    }
    if (features & 0x80) {
        D_80074EA4->control &= ~0x10000;
        D_80074EA4->control |= D_80074EA4->modep->control & 0x300;
    }
    D_80074EA4->state |= 0x08;
    __osRestoreInt(mask);
}
