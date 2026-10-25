#include "types.h"

typedef struct PackedFields {
    u32 word0;
    u32 word4;
    u16 value8;
    u16 valueA;
} PackedFields;

s16 packed_field_primary_get(PackedFields *fields, s16 field)
{
    s32 value = 0;

    switch (field) {
    case 9:
        value = (fields->word0 >> 15) & 0x7FFF;
        break;
    case 10:
        value = fields->value8;
        break;
    case 11:
        value = fields->word4 & 0xFFF;
        break;
    case 12:
        value = (fields->word4 >> 12) & 0xFF;
        break;
    case 13:
        value = fields->word0 & 0x7FFF;
        break;
    case 14:
        value = fields->valueA;
        break;
    case 15:
        value = fields->word4 >> 20;
        break;
    }
    return value;
}
