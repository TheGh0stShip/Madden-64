#include "types.h"

extern u8 D_800747C4[];

void overlay5_packed_text_decode(u8 *destination, u8 *source, s32 length) {
    u8 *start;
    u32 raw;
    u32 character;

    start = destination;
    while (length-- != 0) {
        raw = *source;
        character = raw & 0xFF;
        if (character == 0) {
            *destination = 0;
        } else if (character == 0xF) {
            *destination = ' ';
        } else if ((u32)(raw - 0x10) >= 0x32) {
            *destination = '-';
        } else if (character < 0x1A) {
            *destination = raw + 0x20;
        } else if (character < 0x34) {
            *destination = raw + 0x27;
        } else if (character < 0x42) {
            *destination = D_800747C4[character];
        }
        destination++;
        source++;
    }
    if (*start == 0) {
        start[0] = ' ';
        start[1] = 0;
    }
}
