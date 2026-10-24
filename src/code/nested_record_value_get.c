#include "types.h"

typedef struct InnerRecord {
    u32 field0;
    u32 value;
    u32 field8;
} InnerRecord;

typedef struct OuterRecord {
    InnerRecord* records;
    u8 rest[20];
} OuterRecord;

extern OuterRecord D_8008B078[];

u32 func_800355D8(u16 outer_index, s32 inner_index) {
    return D_8008B078[outer_index].records[inner_index].value;
}
