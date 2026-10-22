#include "types.h"

void func_80017CC8(u8* wrapper, s16 value);

void func_80017CA4(u8* wrapper, s16 value) {
    func_80017CC8(wrapper, (s16)(value << 4));
}

void func_80017CC8(u8* wrapper, s16 value) {
    u8* object = *(u8**)(wrapper + 8);

    *(s16*)(object + 0x3C) = value >> 4;
}

void func_80017CDC(u8* wrapper, u8 value) {
    u8* object = *(u8**)(wrapper + 8);
    u8* destination = *(u8**)(object + 0x28);

    *destination = value;
}
