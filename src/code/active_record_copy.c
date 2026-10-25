#include "types.h"

typedef struct ActiveRecord {
    s32 values[12];
} ActiveRecord;

extern s32 D_8008B35C;
extern ActiveRecord D_80085E68[];

void func_8002CB50(ActiveRecord* source) {
    ActiveRecord* destination = &D_80085E68[D_8008B35C];

    destination->values[0] = source->values[0];
    destination->values[1] = source->values[1];
    destination->values[2] = source->values[2];
    destination->values[3] = source->values[3];
    destination->values[4] = source->values[4];
    destination->values[5] = source->values[5];
    destination->values[6] = source->values[6];
    destination->values[7] = source->values[7];
    destination->values[8] = source->values[8];
    destination->values[9] = source->values[9];
    destination->values[10] = source->values[10];
    destination->values[11] = source->values[11];
}
