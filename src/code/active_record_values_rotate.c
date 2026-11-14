#include "types.h"

typedef struct ActiveRecord {
    s32 values[12];
} ActiveRecord;

extern s32 D_8008B35C;
extern ActiveRecord D_80085E68[];

void func_8002DB7C(void) {
    ActiveRecord* record = &D_80085E68[D_8008B35C];
    s32 temporary;

    temporary = record->values[1];
    record->values[1] = record->values[3];
    record->values[3] = temporary;
    temporary = record->values[2];
    record->values[2] = record->values[6];
    record->values[6] = temporary;
    temporary = record->values[5];
    record->values[5] = record->values[7];
    record->values[7] = temporary;
}
