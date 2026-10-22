#include "types.h"

void func_8002E17C(void* destination, const void* source, u32 size);
extern u8 D_80065430[];

void func_8009B844(void) {
    func_8002E17C(*(void**)0x80078458, D_80065430, 0x20);
}
