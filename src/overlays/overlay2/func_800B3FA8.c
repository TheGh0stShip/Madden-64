#include "types.h"

typedef struct {
    u8 pad00[0x60];
    u8 *mode;
} Owner;

void func_800DD4B8(void);

void func_800B3FA8(Owner *owner) {
    s32 mode = *owner->mode;

    if (mode < 2) {
        if (mode >= 0) {
            func_800DD4B8();
        }
    }
}
