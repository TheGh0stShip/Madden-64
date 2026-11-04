#include "types.h"

extern u8 *D_8007473C[];
extern u32 func_80031A1C(u32 value);
extern void func_8003CF78(u32 value, s32 argument);

void audio_entry_dispatch_primary(u32 index)
{
    u32 entry_address;
    u8 **entry_pointer;
    u8 **table;
    u32 offset;
    u8 *entry;
    u32 value;

    entry_address = (u16)index;
    table = D_8007473C;
    entry_pointer = table + entry_address;
    offset = func_80031A1C(*(u16 *)*entry_pointer) << 1;
    entry = (u8 *)((u16)offset << 1) + (u32)*entry_pointer;
    value = *(u16 *)(entry + 2);
    if (value + 1 != 0) {
        func_8003CF78(value, *(s16 *)(entry + 4));
    }
}
