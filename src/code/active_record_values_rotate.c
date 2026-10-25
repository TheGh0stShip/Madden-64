#include "types.h"

typedef struct ActiveRecord {
    s32 values[12];
} ActiveRecord;

extern s32 D_8008B35C;
extern ActiveRecord D_80085E68[];

void func_8002DB7C(void) {
    volatile ActiveRecord* record = &D_80085E68[D_8008B35C];
    register s32 value1 __asm__("$6") = record->values[1];
    register s32 value3 __asm__("$5") = record->values[3];
    register s32 value6 __asm__("$4") = record->values[6];
    register s32 value7 __asm__("$3") = record->values[7];

    record->values[3] = value1;
    record->values[6] = record->values[2];
    {
        register s32 value5 __asm__("$6") = record->values[5];

        record->values[1] = value3;
        record->values[2] = value6;
        record->values[5] = value7;
        ((ActiveRecord*)record)->values[7] = value5;
    }
}
