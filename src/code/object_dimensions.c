#include "types.h"

extern void func_8000CC18(void* object);

void func_8000C940(u8* object, s16 width, s16 height) {
    *(s16*)(object + 0x1F8) = width;
    *(s16*)(object + 0x1FA) = height;
    func_8000CC18(object);
}

void func_8000C964(u8* object, s16 width, s16 height) {
    *(s16*)(object + 0x200) = width;
    *(s16*)(object + 0x1FC) = width;
    *(s16*)(object + 0x202) = height;
    *(s16*)(object + 0x1FE) = height;
    func_8000CC18(object);
}
