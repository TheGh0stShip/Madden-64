#include "types.h"

void func_800BDE7C(u8* wrapper, u16 bits) {
    u8* object = *(u8**)(wrapper + 0x48);

    *(u16*)(object + 0x14) |= bits;
}

void func_800BDE90(u8* wrapper, u16 bits) {
    u8* object = *(u8**)(wrapper + 0x48);

    *(u16*)(object + 0x14) &= ~bits;
}

u16 func_800BDEA8(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 0x48);

    return *(u16*)(object + 0x14);
}
