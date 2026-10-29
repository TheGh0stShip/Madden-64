#include "types.h"

void overlay5_string_trailing_spaces_trim(u8 *text, u32 length) {
    while (length >= 2 && text[length - 1] == 0x20) {
        text[length - 1] = 0;
        length--;
    }
}
