#include "types.h"

extern s32 func_8002E148(const void *left, const void *right, u32 size);

void record_key_replace(u8 *records, const void *key, const u32 *replacement)
{
    register u8 *cursor __asm__("$16") = *(u8 **)(records + 8);
    register u8 *end __asm__("$17") = *(u8 **)(records + 0x0C);
    register const void *saved_key __asm__("$18") = key;
    register const u32 *saved_replacement __asm__("$19") = replacement;

    while (cursor < end) {
        if (func_8002E148(cursor, saved_key, 8) == 0) {
            *(u32 *)(cursor + 0) = saved_replacement[0];
            *(u32 *)(cursor + 4) = saved_replacement[1];
        }
        cursor += 8;
    }
}
