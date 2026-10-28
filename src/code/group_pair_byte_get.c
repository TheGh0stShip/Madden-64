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
    u32 index;
    u32 pair_index;
    u8* pairs;

    index = D_80088094[source_index].group;
    pair_index = (u16)pair_arg;
    pairs = D_8008B374;
    index = index * 11 + pair_index;
    return pairs[index * 2 + BYTE_INDEX];
}
