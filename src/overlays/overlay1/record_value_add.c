#include "types.h"

extern u8 D_80074808;
extern u8 D_80081602[];

void func_800C68B4(s32 record_index, s32 entry_index, s32 amount) {
    if (D_80074808 == 1) {
        s32 entry_offset = entry_index * 3;
        s32 record_offset = record_index * 0x214C;
        s32 offset = entry_offset + record_offset;
        u32 value = D_80081602[offset] + amount;

        D_80081602[offset] = value;
        if ((u8)value >= 100) {
            D_80081602[offset] = 99;
        }
    }
}
