#include "types.h"

void func_800CDF2C(u8* left, u8* right) {
    *(u8**)(right + 0x44) = left;
    *(u8**)(left + 0x44) = right;
}

void func_800CDF38(u8* object) {
    u8* peer = *(u8**)(object + 0x44);

    *(u8**)(peer + 0x44) = 0;
    *(u8**)(object + 0x44) = 0;
}
