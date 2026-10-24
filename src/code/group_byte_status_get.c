#include "types.h"

typedef struct DataGroup {
    u32* values;
    u8* bytes;
    u8 pad[0x10];
} DataGroup;

extern DataGroup D_8008B07C[];

u32 func_800364E4(u16 group, s32 index) {
    u32 result = D_8008B07C[group].bytes[index];

    if ((result & 0x41) == 0 && D_8008B07C[group].values[index] != 0) {
        result |= 0x80000000;
    }

    return result;
}
