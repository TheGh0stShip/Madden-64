#include "types.h"

extern u8 D_800747C4[];

void overlay5_packed_text_encode(u8 *destination, u8 *source, s32 length) {
    u8 *start;
    u32 index;
    u32 code;
    u8 character;

    start = destination;
    while (length-- != 0) {
        *destination = 0xF;
        if (*source == 0) {
            *destination = 0;
        }
        index = 0;
        code = 0x34;
        do {
            if (*source == D_800747C4[code]) {
                *destination = code;
            }
            index++;
            code++;
        } while (index < 0xE);
        character = *source;
        if ((u32)(character - '0') < 10) {
            *destination = character - 0x20;
        }
        character = *source;
        if ((u32)(character - 'A') < 26) {
            *destination = character - 0x27;
        }
        destination++;
        source++;
    }
    if (*start == 0) {
        start[0] = 0xF;
        start[1] = 0;
    }
}
