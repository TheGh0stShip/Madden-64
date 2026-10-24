#include "types.h"

typedef struct WordEntry {
    u32 value;
    u8 pad[0xC];
} WordEntry;

extern WordEntry D_80074978[];

void func_800451C8(void) {
    u32 count = 3;
    u32 value = 0xCF5C;
    s32 offset = 0x30;
    u32 previous;

    do {
        *(u32 *)((u8 *)D_80074978 + offset) = value;
        offset -= 0x10;
        previous = count;
        count--;
    } while (previous != 0);
}
