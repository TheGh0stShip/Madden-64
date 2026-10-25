#include "types.h"

typedef struct VectorRecord {
    s32 value[3];
    s32 unused;
} VectorRecord;

typedef struct VectorValue {
    s32 value[3];
} VectorValue;

extern void func_8002DBD0(VectorValue* value);

void func_8004528C(s32 unused, VectorRecord* records) {
    register VectorRecord* record __asm__("$5");
    u16 index;
    VectorValue value;

    index = 0;
    do {
        record = (VectorRecord*)(index * sizeof(VectorRecord) + (u32)records);
        __asm__ volatile("" : "=r"(record) : "0"(record));
        value.value[0] = record->value[0];
        value.value[1] = record->value[1];
        value.value[2] = record->value[2];
        index++;
        func_8002DBD0(&value);
    } while (index < 8);
}
