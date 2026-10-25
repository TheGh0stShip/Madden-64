#include "types.h"

extern void* func_80032E00(s32 type, u16 identifier);
extern void func_80096A3C(void* destination, void* source);

void* func_8003E4B4(u16* source) {
    u16 identifier = source[0];
    void* resource;

    identifier = ((identifier & 0xFF) << 8) | (identifier >> 8);
    resource = func_80032E00(0, identifier);

    func_80096A3C(resource, source + 2);
    return resource;
}
