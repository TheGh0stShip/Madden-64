#include "types.h"

extern void func_80041088(void);
extern void func_80008F30(void*, void (*)(void), void*, u16);

void func_80041050(u8* state, void* value) {
    u8* data = *(u8**)(state + 8);

    func_80008F30(value, func_80041088, state, *(u16*)(data + 0x14));
}
