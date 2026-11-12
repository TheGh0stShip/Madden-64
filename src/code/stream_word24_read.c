#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8001C444
#endif

#ifndef MASK
#define MASK 0x40
#endif

#ifndef DESTINATION_INDEX
#define DESTINATION_INDEX 0
#endif

extern u8* D_80079478;
extern u32 D_80079504[];

void FUNCTION(u32 flags) {
    u8* source;
    u32 value;

    if (!(flags & MASK)) {
        source = D_80079478;
        value = (((source[0] << 8) | source[1]) << 8) | source[2];
        D_80079478 = source + 3;
        D_80079504[DESTINATION_INDEX] = value << 8;
    }
}
