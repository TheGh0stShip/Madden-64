#include "types.h"

extern u32 D_80078458;

void func_80099828(u8* object) {
    s32 index;
    u8* entry;
    u8 value;
    u8* child = *(u8**)(object + 8);
    u8* entries;

    *(u32*)(child + 0x64) = D_80078458;
    *(u16*)(child + 0x68) |= 0x14;
    entries = *(u8**)(child + 0x7C);
    if (entries != 0) {
        index = 7;
        value = 0x8C;
        entry = entries + 0x70;
        do {
            entry[15] = value;
            entry -= 16;
        } while (index-- != 0);
    }
}
