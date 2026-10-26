#include "types.h"

extern u8 D_800C4EEB;
extern u16 D_80086190[];
extern u16 D_8006B9E4[];
extern u16 D_8006B9E0;
extern s16 func_8002B5EC(u32 identifier);

u16 frame_identifier_find(u32 identifier)
{
    u16 *identifiers;
    s32 count;
    u16 index;

    if ((s16)func_8002B5EC(identifier) == 1) {
        count = D_800C4EEB;
        __asm__("" : "=r"(count) : "0"(count));
        identifiers = D_80086190;
        count <<= 24;
        count >>= 24;
    } else {
        identifiers = D_8006B9E4;
        count = D_8006B9E0;
    }
    index = 0;
    if ((u16)count != 0) {
        do {
            if (identifiers[index] == (u16)identifier) {
                return index;
            }
            index++;
        } while (index < (u16)count);
    }
    return 0;
}
