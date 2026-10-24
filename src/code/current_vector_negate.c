#include "types.h"

#ifndef FUNCTION
#define FUNCTION func_8002D350
#endif

#ifndef ROW
#define ROW 0
#endif

typedef struct VectorRecord {
    s32 vectors[3][3];
    u8 rest[12];
} VectorRecord;

extern s32 D_8008B35C;
extern VectorRecord D_80085E68[];

void FUNCTION(void) {
    VectorRecord* record = &D_80085E68[D_8008B35C];
    s32 x = record->vectors[ROW][0];
    s32 y = record->vectors[ROW][1];
    s32 z = record->vectors[ROW][2];

    x = -x;
    y = -y;
    z = -z;
    record->vectors[ROW][0] = x;
    record->vectors[ROW][1] = y;
    record->vectors[ROW][2] = z;
}
