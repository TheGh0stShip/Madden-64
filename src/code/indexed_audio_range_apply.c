#include "types.h"

extern s32 D_80073508;
extern void func_8003D8F4(void* object, s32 first, s32 second);

void func_8003D074(void* object, s16 index) {
    s32 value = D_80073508 * 10 + index * 3 + 60;

    func_8003D8F4(object, value, value);
}
