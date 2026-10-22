#include "types.h"

void func_800BBB18(u8* object);

s32 func_800BF570(u8* object) {
    if ((*(u16*)(object + 0x28) & 0x10) == 0) {
        func_800BBB18(object);
    }
    return 0;
}
