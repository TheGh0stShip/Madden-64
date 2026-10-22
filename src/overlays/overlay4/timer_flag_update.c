#include "types.h"

extern s32 D_80084F34;

void func_800DDE60(u8* object) {
    u16 flags = *(u16*)(object + 0x28);

    if (!(flags & 0x80) &&
        *(s32*)(*(u8**)(object + 0x24) + 0x20) > D_80084F34 + 0xA0000) {
        *(u16*)(object + 0x28) = flags | 0x80;
    }
}
