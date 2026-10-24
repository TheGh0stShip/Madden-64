#include "types.h"

typedef struct VectorRecord {
    u8 rest[0x24];
    u32 vector[3];
} VectorRecord;

extern s32 D_8008B35C;
extern VectorRecord D_80085E68[];

void func_8002D884(u32* destination) {
    VectorRecord* source = &D_80085E68[D_8008B35C];

    destination[0] = source->vector[0];
    destination[1] = source->vector[1];
    destination[2] = source->vector[2];
}
