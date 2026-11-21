#include "types.h"
extern u8 *D_80073438;
extern void func_8002E17C(void *destination, const void *source, u32 size);
void frame_halfword_remove(u16 value)
{
    u16 i;
    for (i = 0; i < 128; i++) {
        if (*(u16 *)(D_80073438 + 0xCE4 + i * 2) == value) {
            func_8002E17C(D_80073438 + 0xCE4 + i * 2,  D_80073438 + ((i + 1) * 2 + 0xCE4), (127 - i) * 2);
            *(u16 *)(D_80073438 + 0xDE2) = 0xFFFF;
            return;
        }
    }
}
