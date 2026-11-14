#include "types.h"

extern u32 func_8004DF94(u8 *string);
extern s16 func_80016A24(s32 font, u8 *string);

void string_tail_clear(u8 *string, u8 limit, s16 font)
{
    u8 *end = string + func_8004DF94(string);

    while (func_80016A24(font, string) > (limit & 0xFF)) {
        end--;
        if (string < end) {
            *end = 0;
        }
    }
}
