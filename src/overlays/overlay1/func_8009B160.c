#include "types.h"

void func_8004DF68(u8 *dst, u8 *src, s32 len);

void func_8009B160(u8 *dst, u8 *src) {
    u16 pos = 0;
    s32 c;
    u16 len;
    u16 offset;
    u8 *d;


    while (1) {
        c = *src++;
        if (c & 0x80) {
            len = (u8)(c & 0x7F);
            if (len == 0) {
                break;
            }
            d = dst + pos; offset = src[1] << 8 | src[0]; src += 2; len++; func_8004DF68(d, dst + offset, len); pos += len;
        } else {
            func_8004DF68(dst + pos, src, (c & 0x7F) + 1); pos += (c & 0x7F) + 1; src += (c & 0x7F) + 1;
        }
    }
}
