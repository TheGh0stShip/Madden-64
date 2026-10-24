#include "types.h"

extern void func_80032F3C(s32 pool, void* resource);

void func_8001B410(s32 unused, u8* object) {
    void* resource = *(void**)(object + 0x30);

    if (resource != 0) {
        func_80032F3C(0, resource);
        *(void**)(object + 0x30) = 0;
    }
}
