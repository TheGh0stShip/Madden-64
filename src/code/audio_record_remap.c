#include "types.h"

void audio_record_remap(u8 *record)
{
    register u32 seven __asm__("$10");
    register u32 eight __asm__("$9");
    register u32 ten __asm__("$8");
    register u32 temp __asm__("$2");

    switch (record[0]) {
    case 10:
    case 16:
    {
        register u32 value __asm__("$7") = record[2];
        temp = value - 0x80;
        __asm__("" : "=r"(temp) : "0"(temp));
        record[2] = (-temp) & 0x7F;
        break;
    }
    case 4:
    {
        register u32 first_value __asm__("$3") = record[2];
        register u32 second_value __asm__("$7");
        switch (first_value) {
        case 11:
            record[2] = 12;
            break;
        case 12:
            record[2] = 11;
            break;
        }
        second_value = record[3];
        temp = second_value - 0x80;
        __asm__("" : "=r"(temp) : "0"(temp));
        record[3] = (-temp) & 0x7F;
        break;
    }
    case 27:
    case 47:
    {
        register s32 i __asm__("$7");
        register u32 value __asm__("$6");
        register u8 *element __asm__("$5");
        i = 0;
        seven = 7;
        eight = 8;
        ten = 10;
loop:
        {
            temp = (s16)i;
            element = record + temp;
            value = element[1];
            if ((value & 0xFF) < 8) {
                temp = seven - value;
                __asm__("" : "=r"(temp) : "0"(temp));
                element[1] = temp;
            } else if ((value & 0xFF) == eight) {
                element[1] = ten;
            } else if ((value & 0xFF) == ten) {
                element[1] = eight;
            }
            temp = i + 1;
            i = temp;
            __asm__("" : "=r"(temp) : "0"(temp));
            if ((s16)temp < 3) {
                goto loop;
            }
        }
        break;
    }
    }
}
