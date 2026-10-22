#include "types.h"

void func_80008F30(s32 destination, const void* source, s32 value, s32 id);
extern u8 D_8009B144[];

void func_8009F838(s32 value, s32 destination) {
    func_80008F30(destination, D_8009B144, value, 0xEB);
}
