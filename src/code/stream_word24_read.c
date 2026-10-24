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
    register u8* source __asm__("$3");
    register u32 value __asm__("$2");
    register u32 byte1 __asm__("$4");
    register u32 byte2 __asm__("$5");

    if (!(flags & MASK)) {
        source = D_80079478;
        value = source[0];
        byte1 = source[1];
        byte2 = source[2];
        D_80079478 = source + 3;
        value = (value << 8) | byte1;
        value = (value << 8) | byte2;
        D_80079504[DESTINATION_INDEX] = value << 8;
    }
}
