#include "types.h"

extern u8 *D_8008B080[];
extern u32 *D_8008B07C[];
extern u32 func_80035D7C(u32 identifier, ...);

u32 audio_entry_resource_mark(u32 identifier, u32 entry)
{
    register u32 saved_identifier __asm__("$16");
    register u32 saved_entry __asm__("$17");
    register u32 condition __asm__("$4");
    register u32 offset __asm__("$4");
    register u8 *flags __asm__("$3");
    register u32 *resources __asm__("$3");
    register u32 entry_offset __asm__("$2");
    u32 result;
    saved_entry = entry;
    __asm__("" : "=r"(saved_entry) : "0"(saved_entry));
    saved_identifier = identifier;
    __asm__("" : "=r"(saved_identifier) : "0"(saved_identifier));

    condition = identifier & 0x8000;
    if (condition == 0) {
        saved_identifier = (u16)saved_identifier;
        func_80035D7C(saved_identifier);
        offset = saved_identifier << 1;
        offset += saved_identifier;
        offset <<= 3;
        flags = *(u8 **)((u8 *)D_8008B080 + offset);
        flags[saved_entry] |= 0x80;
        resources = *(u32 **)((u8 *)D_8008B07C + offset);
        entry_offset = saved_entry << 2;
        result = *(u32 *)(entry_offset + (u32)resources);
        goto done;
    }
    result = func_80035D7C((u16)saved_identifier, saved_entry);
done:
    return result;
}
