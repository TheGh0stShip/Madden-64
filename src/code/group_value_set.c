#include "types.h"

typedef struct ValueGroup {
    u32* values;
    u8 pad4[0x14];
} ValueGroup;

extern ValueGroup D_8008B07C[];

void func_80036438(u16 group, s32 index, u32 value) {
    D_8008B07C[group].values[index] = value;
}
