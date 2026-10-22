#include "types.h"

void func_80008F30(s32 destination, const void* source, s32 value, s32 id);
extern u8 D_800958B4[];

void func_80099F98(s32 value, s32 destination) {
    *(s32*)0x80078454 = 0;
    *(s32*)0x80078450 = 0;
    func_80008F30(destination, D_800958B4, value, 0x96);
}
