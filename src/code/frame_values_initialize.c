#include "types.h"

extern u16* func_8003A358(void);
extern void func_80033308(s32 type, void* buffer, s32 size, s32 mode);

void func_80039BB0(void) {
    u16 index;
    u16* values = func_8003A358();

    func_80033308(0, values, 0x100, 0xFF);
    values = func_8003A358();
    index = 0;
    do {
        *values++ = index++ + 0x175F;
    } while (index < 110);
}
