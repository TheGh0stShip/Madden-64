#include "types.h"

void func_80033258(void* object);

void func_800C4060(void) {
    void* object = *(void**)0x8007A550;

    *(s32*)0x800855F8 = 0;
    func_80033258(object);
}
