#include "types.h"

typedef struct {
    u8 pad00[0x74];
    s32 cells[0x5A];
} Board;

extern u8 D_800C507A;
extern s32 D_80087AA4;

void func_8000C940(s32, s32, s32);
void func_8000C964(s32, s32, s32);

void func_800B71F8(Board *board) {
    s32 *cells = board->cells;
    s16 i;

    D_800C507A = 1;
    cells[0] = 0x5A;
    for (i = 1; i < 0x5A; i++) {
        cells[i] = 0;
    }
    func_8000C940(D_80087AA4, 0x1E, 0);
    func_8000C964(D_80087AA4, 0x112, 0xF0);
}
