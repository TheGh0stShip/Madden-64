#include "types.h"

/* Slot table: row count, then rows of 49 slot ids (0xFFFF = empty) at +0x8A. */
typedef struct {
    s8 count;
    u8 pad01[0x89];
    u16 rows[1][49];
} SlotTable;

extern SlotTable D_800C4AD2;
extern s8 D_800C0160[];
extern s8 D_800C0161[];

s32 func_8009B43C(void) {
    s32 row;
    s32 group;
    s32 i;
    s32 found;

    for (row = 0; row < D_800C4AD2.count; row++) {
        for (group = 0; group < 23; group++) {
            found = -1;
            for (i = D_800C0160[group]; i < D_800C0161[group]; i++) {
                if (D_800C4AD2.rows[row][i] == 0xFFFF) {
                    found = i;
                    break;
                }
            }
            if (found != -1) {
                return 0;
            }
        }
    }
    return 1;
}
