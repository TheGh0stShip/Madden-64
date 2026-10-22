#include "types.h"

typedef void (*ReleaseCallback)(void*);

void func_8006337C(u8* state) {
    u8* object = *(u8**)(state + 4);

    if (object != 0) {
        ReleaseCallback release = *(ReleaseCallback*)(object + 0x28);
        release(state);
    }
    *(u32*)(state + 4) = 0;
    *(u32*)(state + 0x10) = 0;
}
