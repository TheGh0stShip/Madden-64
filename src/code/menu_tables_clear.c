#include "types.h"

typedef struct MenuTables {
    s16 first;
    u8 pad0[0xA6];
    s16 first_table[23];
    u8 pad1[0x2076];
    s16 second;
    u8 pad2[0xA6];
    s16 second_table[23];
} MenuTables;

extern MenuTables D_80082CA8;

void func_80025AB8(void) {
    s16 i;

    D_80082CA8.first = 0;
    D_80082CA8.second = 0;
    for (i = 0; i < 23; i++) {
        D_80082CA8.first_table[i] = 0;
        D_80082CA8.second_table[i] = 0;
    }
}
