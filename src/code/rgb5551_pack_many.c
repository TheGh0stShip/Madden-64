#include "types.h"

void rgb5551_pack_many(u16 *output, const u8 *input, s32 count)
{
    s32 n = (s16)count;
    u32 r, g, b;

    if (n-- == 0) {
        return;
    }
    do {
        r = input[0];
        g = input[1];
        b = input[2];
        input += 3;
        r >>= 3;
        g >>= 3;
        b >>= 3;
        *output++ = (r << 11) | (g << 6) | (b << 1) | 1;
    } while (n-- != 0);
}
