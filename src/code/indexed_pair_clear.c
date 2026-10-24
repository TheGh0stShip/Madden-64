#include "types.h"

typedef struct IndexedRecord {
    s32 value0;
    s32 value1;
    u8 rest[0x7C0];
} IndexedRecord;

extern IndexedRecord D_80078590[];

void func_8001F754(s32 index) {
    index = (u8)index;
    D_80078590[index].value0 = 0;
    D_80078590[index].value1 = 0;
}
