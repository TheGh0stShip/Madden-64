#include "types.h"

typedef struct PackedExtended {
    u32 word0;
    u32 word4;
    u32 word8;
} PackedExtended;

s16 packed_field_extended_get(PackedExtended *fields, s16 field)
{
    s32 value = 0;

    switch (field) {
    case 23:
        value = fields->word8 >> 22;
        break;
    case 24:
        value = fields->word4 >> 23;
        break;
    case 25:
        value = fields->word0 & 0x7F;
        break;
    case 40:
        value = fields->word4 & 0x7F;
        break;
    case 26:
        value = (fields->word4 >> 15) & 0xFF;
        break;
    case 27:
        value = (fields->word4 >> 7) & 0xFF;
        break;
    case 28:
        value = (fields->word8 >> 7) & 0x1F;
        break;
    case 29:
        value = (fields->word8 >> 12) & 0x3FF;
        break;
    case 30:
        value = (fields->word0 >> 15) & 0x7FFF;
        break;
    case 31:
        value = (fields->word0 >> 7) & 0xFF;
        break;
    case 32:
        value = fields->word8 & 0x7F;
        break;
    }
    return value;
}
