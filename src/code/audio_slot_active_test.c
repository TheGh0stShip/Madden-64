#include "types.h"

extern u8 D_80081860[];
extern u8 D_80080CFC[];
extern u8 D_80082D84[];

s32 audio_slot_active_test(u8 *object)
{
    s16 index;
    register u32 inactive __asm__("$7");
    register u32 entry_base __asm__("$4");
    register u32 key __asm__("$5");

    {
        register u32 value __asm__("$3");
        register u8 *base __asm__("$5");
        register u32 offset __asm__("$2");
        u8 *slot;

        value = object[0x1E];
        __asm__("" : "=r"(value) : "0"(value));
        index = 0;
        __asm__("" : "=r"(index) : "0"(index));
        inactive = 0x80;
        __asm__("" : "=r"(inactive) : "0"(inactive));
        base = D_80081860;
        offset = value * 8524;
        value = object[0x1F];
        __asm__("" : "=r"(value) : "0"(value));
        slot = base + offset;
        base -= 0xB64;
        __asm__("" : "=r"(base) : "0"(base));
        value = *(s16 *)(slot + value * 2);
        entry_base = offset;
        key = *(u16 *)(entry_base + base + value * 2);
        __asm__("" : "=r"(index) : "0"(index), "r"(key));
    }
    do {
        u32 entry_offset = entry_base + index * 4;
        if (*(u16 *)(D_80082D84 + entry_offset) != key) goto increment;
        if (*(u8 *)(D_80082D84 + entry_offset + 3) == inactive) goto increment;
        {
            register s32 result __asm__("$2") = 1;
            __asm__("" : "=r"(result) : "0"(result));
            return result;
        }
increment:
        index++;
    } while (index < 4);
    return 0;
}
