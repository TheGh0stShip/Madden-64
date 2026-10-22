#include "types.h"

extern void func_80032F3C(s32 type, void* object);

void func_80033258(u8* stream) {
    func_80032F3C(*(s16*)(stream + 2), *(void**)(stream + 8));
    func_80032F3C(0, stream);
}
