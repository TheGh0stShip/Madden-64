#include "types.h"

extern void func_8005B618(void* object);

void func_8005B66C(u8* object) {
    *(s32*)(object + 0x94) = 0;
    func_8005B618(object);
}
