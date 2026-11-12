#include "types.h"

extern u8 *D_8008B080[];
extern u32 *D_8008B07C[];
extern u32 func_80035D7C(u32 identifier, ...);

u32 audio_entry_resource_mark(u32 identifier, u32 entry)
{
    u32 saved_identifier;
    u32 saved_entry;
    u32 offset;
    u8 *flags;
    u32 *resources;
    u32 entry_offset;
    u32 result;

    saved_entry = entry;
    saved_identifier = identifier;
    for (;;) {
        if (saved_identifier == identifier) {
            break;
        }
    }

    identifier &= 0x8000;
    if (identifier == 0) {
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
