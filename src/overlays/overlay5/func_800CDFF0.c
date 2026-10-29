#include "types.h"

typedef struct Overlay5ModeTarget {
    u8 pad0[0x20];
    s32 value;
} Overlay5ModeTarget;

extern u8 D_8007A388;

void func_800CDFF0(Overlay5ModeTarget* target, u8 index) {
    if (D_8007A388 == 2) {
        target->value = index * 13 + 0x93;
    } else if (D_8007A388 == 1) {
        target->value = 0x78;
    } else {
        target->value = 0xF4;
    }
}
