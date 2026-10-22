#include "types.h"

extern u8* D_800748E8;
extern void func_800332C8(u8* state, u32 value);

void func_80044424(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);
    func_800332C8(D_800748E8, *(u32*)(object + 0x28));
}
