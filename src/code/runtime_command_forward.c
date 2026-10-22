#include "types.h"

extern void func_80063250(void*, u32, u32, u32, u32, u32);

void func_8005FB60(u8* state, void** object, u32 first, u32 second,
                   u32 third) {
    func_80063250(*object, first, second, 0, third,
                  *(u32*)(state + 0x70));
}
