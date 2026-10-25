#include "types.h"

typedef struct AudioGrid {
    s8 entries[55][3];
    u8 padA5[0x20A7];
} AudioGrid;

extern AudioGrid D_80081602[];

void func_800374B0(void) {
    s32 row;
    s32 index;

    for (row = 0; row < 2; row++) {
        for (index = 54; index >= 0; index--) {
            D_80081602[row].entries[index][0] = 0;
        }
    }
}
