#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8003C6B4
#endif

#ifndef BYTE_INDEX
#define BYTE_INDEX 0
#endif

typedef struct GroupSource {
    u8 pad00[6];
    u8 group;
    u8 pad07[33];
} GroupSource;

extern GroupSource* D_80088094;
extern u8* D_8008B374;

s32 FUNCTION(u16 source_index, s32 pair_arg) {
    register u32 index __asm__("$4");
    register u32 pair_index __asm__("$5");
    register u8* pairs __asm__("$3");
    register u32 temporary __asm__("$2");

    index = D_80088094[source_index].group;
    __asm__ volatile("" : "=r"(index) : "0"(index));
    pair_index = (u16)pair_arg;
    __asm__ volatile("" : "=r"(pair_index) : "0"(pair_index));
    pairs = D_8008B374;
    __asm__ volatile("" : "=r"(pairs) : "0"(pairs));
    temporary = index << 1;
    temporary += index;
    temporary <<= 2;
    temporary -= index;
    index = temporary + pair_index;
    temporary = index << 1;
    temporary += (u32)pairs;
    return ((u8*)temporary)[BYTE_INDEX];
}
