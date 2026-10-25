#include "types.h"

extern u8 func_8003C6B4(u16 group, u16 index);

s16 attribute_count_matches(u16 group, s16 attribute)
{
    u16 index;
    s16 count = 0;

    for (index = 0; index < 11; index++) {
        if (func_8003C6B4(group, index) == attribute) {
            count++;
        }
    }
    return count;
}
