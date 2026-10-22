#include "types.h"

extern void func_80041584(u8* object, s8 value);

void func_800217C8(u8* wrapper, s8 value) {
    u8* link = *(u8**)(wrapper + 4);
    func_80041584(*(u8**)(link + 8), value);
}
