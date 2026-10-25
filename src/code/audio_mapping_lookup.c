#include "types.h"

extern u16 *D_800740C4;
extern u32 func_8003FF30(const u16 *entry, u16 value);

u32 audio_mapping_lookup(u16 key, u32 value)
{
    register u32 saved_value __asm__("$18") = value;
    register u32 saved_key __asm__("$17");
    register u32 index __asm__("$16");
    register u32 result __asm__("$6");
    register u16 *table __asm__("$5") = D_800740C4;

    result = 11;
    index = 0;
    if (table[0] != 0) {
        saved_key = key & 0xFFFF;
        do {
            u16 truncated = index;
            u32 offset = truncated * 4;
            u8 *entry = (u8 *)table + offset;

            if (*(u16 *)(entry + 2) == saved_key) {
                offset += 2;
                result = func_8003FF30((u16 *)((u8 *)table + offset),
                                      saved_value & 0xFFFF);
            }
            table = D_800740C4;
            index++;
        } while ((u16)index < table[0]);
    }
    return result;
}
