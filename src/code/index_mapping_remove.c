#include "types.h"

typedef struct MappingRecord {
    u8 pad[0x18];
    u32 flags;
    u8 tail[4];
} MappingRecord;

typedef struct MappingContext {
    u8 pad[0x14];
    MappingRecord* records;
} MappingContext;

extern s8 D_80087B10[];
extern s8 D_80087B08[];
extern MappingContext* D_80064A00;

void func_8003D0E4(s32 index) {
    s32 mapped = D_80087B10[index];
    s32 reverse = D_80087B08[mapped];

    if (reverse == index) {
        if (D_80064A00 != 0) {
            D_80064A00->records[mapped].flags |= 8;
        }
        mapped = D_80087B10[reverse];
        D_80087B10[reverse] = -1;
        D_80087B08[mapped] = -1;
    }
}
