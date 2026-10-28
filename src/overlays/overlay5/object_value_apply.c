#include "types.h"

void func_80032F3C(s32 slot, s32 value);

void func_800DB1F8(u8* object) {
    s32* values = *(s32**)(object + 0xC);

    func_80032F3C(0, values[0]);
}
