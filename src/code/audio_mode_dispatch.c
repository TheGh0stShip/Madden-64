#include "types.h"

extern void func_80042248(void* target, u8 mode, u8 value, s32 extra);
extern void func_80042420(void* target, u8 mode, u8 value, s32 extra);

void func_8004256C(void* target, s32 mode, s32 value, s32 extra) {
    mode &= 0xFF;
    if (mode >= 0) {
        if (mode < 2) {
            func_80042248(target, mode, value, extra);
        } else if (mode < 4) {
            func_80042420(target, mode, value, extra);
        }
    }
}
