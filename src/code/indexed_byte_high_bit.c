#include "types.h"

typedef struct ByteBufferEntry {
    u8 *data;
    u8 pad[0x14];
} ByteBufferEntry;

extern ByteBufferEntry D_8008B080[];

#ifndef FUNCTION
#define FUNCTION func_80036100
#endif

void FUNCTION(u16 index, s32 offset) {
#ifdef CLEAR_HIGH_BIT
    D_8008B080[index].data[offset] &= 0x7F;
#else
    D_8008B080[index].data[offset] |= 0x80;
#endif
}
