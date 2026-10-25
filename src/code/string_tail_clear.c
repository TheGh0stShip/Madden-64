#include "types.h"

extern u32 func_8004DF94(u8 *string);
extern s32 func_80016A24(s32 font, u8 *string);

void string_tail_clear(u8 *string, u32 limit, s32 font)
{
    register u8 *saved_string __asm__("$19");
    register s32 saved_font __asm__("$16");
    register s32 saved_limit __asm__("$17");
    saved_string = string;
    saved_font = font;
    saved_limit = limit;
    __asm__("" : "=r"(saved_string), "=r"(saved_font),
            "=r"(saved_limit)
            : "0"(saved_string), "1"(saved_font),
            "2"(saved_limit));
    {
        register u8 *end __asm__("$18");

        end = saved_string + func_8004DF94(string);
        saved_font <<= 16;
        saved_limit &= 0xFF;
        while (saved_limit < (s16)func_80016A24(saved_font >> 16,
                                                 saved_string)) {
            end--;
            if (saved_string < end) {
                *end = 0;
            }
        }
    }
}
