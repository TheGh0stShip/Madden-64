#include "types.h"

void func_80032F3C(s32 pool, void* object);

void func_8009F6C0(u8* wrapper) {
    u8* object = *(u8**)(wrapper + 8);

    func_80032F3C(0, *(void**)(object + 8));
    func_80032F3C(0, *(void**)(object + 0x10));
}
