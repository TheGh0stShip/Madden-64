#include "types.h"

typedef struct RuntimeRecord {
    u8 pad0[4];
    s32 size;
    s32 count;
    u8 data[1];
} RuntimeRecord;

extern void* D_80084F28;
extern RuntimeRecord* func_80037174(void* list, void* source);
extern s32 func_8003720C(void* data, s32 size);

s32 func_800370B0(void* source) {
    RuntimeRecord* record = func_80037174(D_80084F28, source);

    if (record != 0) {
        record->count = func_8003720C(record->data, record->size - 12);
        return -1;
    }
    return 0;
}
