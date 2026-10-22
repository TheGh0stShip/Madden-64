#include "types.h"

void func_800C20F0(void);

void func_800C669C(s32 angle) {
    angle = (angle + 0x400) & 0xFFF;
    if (angle >= 0x801) {
        func_800C20F0();
    }
}
