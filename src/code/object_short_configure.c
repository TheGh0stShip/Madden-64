#include "types.h"

extern void func_8000BE80(void);
extern void func_8000CCC8(void* object);

void func_8000B7A4(u8* object, s16 value) {
    func_8000BE80();
    *(s16*)(object + 4) = value;
    func_8000CCC8(object);
}
