#include "types.h"

typedef struct RuntimeRecord {
    u8 pad[0x18];
    s32 active;
    s32 value;
} RuntimeRecord;

RuntimeRecord* func_800610CC(RuntimeRecord* records, s32 count) {
    s32 maximum = 0;
    s32 i;
    RuntimeRecord* result = 0;

    for (i = 0; i < count; i++, records++) {
        if (maximum < records->value && records->active > 0) {
            result = records;
            maximum = records->value;
        }
    }
    return result;
}
