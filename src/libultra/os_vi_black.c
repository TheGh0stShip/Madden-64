#include "types.h"

typedef struct OSViContext {
    unsigned short state;
} OSViContext;

extern OSViContext* D_80074EA4;
extern u32 __osDisableInt(void);
extern void __osRestoreInt(u32 mask);

void osViBlack(u8 active) {
    register u32 saveMask = __osDisableInt();

    if (active) {
        D_80074EA4->state |= 0x20;
    } else {
        D_80074EA4->state &= ~0x20;
    }

    __osRestoreInt(saveMask);
}
