#include "types.h"

extern void* func_80032E00(s32, u32);
extern void func_80008E6C(u32*);

u32* func_80008DF8(s32 count) {
    u32* array = func_80032E00(0, count * 4 + 4);

    array[0] = count;
    func_80008E6C(array);
    return array;
}
