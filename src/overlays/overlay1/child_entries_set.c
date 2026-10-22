#include "types.h"

void func_80099874(u8* object, u8 value) {
    s32 index;
    u8* entry;
    u8* child = *(u8**)(object + 8);
    u8* entries = *(u8**)(child + 0x7C);

    *(u16*)(child + 0x68) |= 4;
    if (entries != 0) {
        index = 7;
        entry = entries + 0x70;
        do {
            entry[15] = value;
            entry -= 16;
        } while (index-- != 0);
    }
}
