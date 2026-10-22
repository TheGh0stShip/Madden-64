#include "types.h"

typedef struct RuntimeRecord {
    u8 pad[0x18];
    s32 value;
    u32 trailing;
} RuntimeRecord;

RuntimeRecord* func_80061120(RuntimeRecord* records, s32 count) {
    s32 maximum = 0;
    s32 i;
    RuntimeRecord* result = 0;

    for (i = 0; i < count; i++, records++) {
        if (maximum < records->value) {
            result = records;
            maximum = records->value;
        }
    }
    return result;
}
