#include "types.h"

extern void func_8004256C(void* object, u8 first, u8 second);

void func_80044F6C(u8* wrapper, u8 first, u8 second) {
    func_8004256C(*(void**)(wrapper + 0x28), first, second);
}
