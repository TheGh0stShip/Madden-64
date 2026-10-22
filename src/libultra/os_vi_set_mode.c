#include "os_internal.h"

void osViSetMode(OSViMode* mode) {
    register u32 mask;

    mask = __osDisableInt();
    D_80074EA4->modep = mode;
    D_80074EA4->state = 1;
    D_80074EA4->control = D_80074EA4->modep->control;
    __osRestoreInt(mask);
}
