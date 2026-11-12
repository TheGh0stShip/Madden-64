#include "types.h"

extern u8 D_80080CFC[];

void* audio_frame_record_find(u16 primary, s32 value) {
    u16 index = 0;
    u8* values = D_80080CFC + primary * 8524;
    u8* records;

    value &= 0xFFFF;
    records = D_80080CFC + 0x6E + primary * 8524;
    while (index < 55) {
        if (*(u16*)(values + index * 2) == value) {
            return records + index * 40;
        }
        index++;
    }
    return 0;
}
