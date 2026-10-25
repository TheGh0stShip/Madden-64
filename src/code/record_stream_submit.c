#include "types.h"

typedef struct StreamEntry {
    u32 value;
    u8 pad4[8];
} StreamEntry;

typedef struct StreamRecord {
    StreamEntry* entries;
    u8 pad4[8];
    void* stream;
    u8 pad10[8];
} StreamRecord;

extern StreamRecord D_8008B078[];
extern s32 D_8008617C;
extern void func_80036628(void* stream, u32 value, s32 mode);

s32 func_80035610(u16 record_index, s32 entry_index) {
    func_80036628(D_8008B078[record_index].stream,
                  D_8008B078[record_index].entries[entry_index].value, 0);
    return D_8008617C;
}
