#include "types.h"

extern u8 D_80080D77[];
extern u8 D_80081860[];

u8 func_800BD308(u8* object) {
    s32 record_index = object[0x1E];
    s32 entry_index = object[0x1F];
    s32 record_offset = record_index * 0x214C;
    u8* lookup_base = D_80081860;
    s16 offset = *(s16*)(lookup_base + record_offset + entry_index * 2);

    return D_80080D77[record_offset + offset * 0x28];
}
