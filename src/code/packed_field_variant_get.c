#include "types.h"

typedef struct PackedVariant {
    u32 word0;
    u32 word4;
    u32 word8;
} PackedVariant;

s16 packed_field_variant_get(PackedVariant *fields, s16 field)
{
    s32 value = 0;

    switch (field) {
    case 3:
        value = (fields->word4 >> 9) & 0xFFF;
        break;
    case 4:
        value = fields->word4 >> 21;
        break;
    case 5:
        value = *(u16 *)((u8 *)fields + 2);
        break;
    case 6:
        value = fields->word8 >> 22;
        break;
    case 7:
        value = *(u16 *)fields & 0x7F;
        break;
    case 8:
        value = (fields->word8 >> 14) & 0xFF;
        break;
    case 9:
        value = fields->word4 & 0x1FF;
        break;
    case 10:
        value = (s32)(fields->word8 << 18) >> 18;
        break;
    case 11:
        value = (fields->word0 >> 23) & 0x7F;
        break;
    }
    return value;
}
