#include "types.h"

typedef struct LateEntry {
    u8 bytes[224];
} LateEntry;

extern LateEntry D_8007A610[];

void func_80044C48(u8* object) {
    *(LateEntry**)(object + 0x24) = &D_8007A610[object[0x51]];
}
