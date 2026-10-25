#include "types.h"

typedef struct PackedFields {
    u32 word0;
    u32 word4;
    u16 value8;
    u16 valueA;
} PackedFields;

s16 packed_field_secondary_get(PackedFields *fields, s16 field)
{
    s32 value = 0;

    switch (field) {
    case 16:
        value = fields->word4 >> 17;
        break;
    case 17:
        value = fields->value8;
        break;
    case 18:
        value = (fields->word0 >> 18) & 0xFFF;
        break;
    case 19:
        value = (fields->word0 >> 6) & 0xFFF;
        break;
    case 20:
        value = fields->valueA;
        break;
    case 21:
        value = (fields->word4 >> 9) & 0xFF;
        break;
    case 22:
        value = fields->word4 & 0x1FF;
        break;
    }
    return value;
}
