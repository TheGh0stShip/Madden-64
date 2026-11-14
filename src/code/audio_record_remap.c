#include "types.h"

void audio_record_remap(u8 *record)
{
    s16 i;
    s16 centered;
    u8 *element;
    u8 value;

    switch (record[0]) {
    case 10:
    case 16:
        i = record[2];
        centered = i - 0x80;
        record[2] = -centered & 0x7F;
        break;
    case 4:
        switch (record[2]) {
        case 11:
            record[2] = 12;
            break;
        case 12:
            record[2] = 11;
            break;
        }
        i = record[3];
        centered = i - 0x80;
        record[3] = -centered & 0x7F;
        break;
    case 27:
    case 47:
        i = 0;
        do {
            element = &record[i];
            value = element[1];
            if (value < 8) {
                element[1] = 7 - value;
            } else if (value == 8) {
                element[1] = 10;
            } else if (value == 10) {
                element[1] = 8;
            }
            i++;
        } while (i < 3);
        break;
    }
}
