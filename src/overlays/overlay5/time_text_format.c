#include "types.h"

void func_800167FC(s8 value, u8 *text);

void overlay5_time_text_format(s16 value, u8 *text) {
    s8 minutes = value / 60;
    s8 seconds = value % 60;
    u8 *cursor;

    func_800167FC(minutes, text);
    cursor = text;
    while (*cursor != '\0') {
        cursor++;
    }
    *cursor++ = ':';
    if (seconds < 10) {
        *cursor++ = '0';
    }
    func_800167FC(seconds, cursor);
}
