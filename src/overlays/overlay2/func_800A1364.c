#include "types.h"

typedef struct {
    u8 v[15];
} Cells15;

typedef struct {
    u8 pad00[0x14];
    s32 unk14;
    s32 unk18;
    u8 pad1C[0x338];
    s32 state;
    s32 unk358;
    s32 unk35C;
    s32 unk360;
    s32 unk364;
    s32 unk368;
    s32 unk36C;
} Board;

extern Cells15 D_8000289C;
extern Cells15 D_800028AC;

void func_8001EC20(s32, s32);

void func_800A1364(Board *board, s32 *cells) {
    Cells15 first = D_8000289C;
    Cells15 second = D_800028AC;
    s32 a;
    s32 b;

    a = second.v[board->state];
    b = first.v[board->state];
    cells[a] = board->unk360;
    cells[b] = board->unk364;
    cells[a + 1] = board->unk368;
    cells[b + 1] = board->unk36C;
    board->unk35C = 1;
    func_8001EC20(board->unk14, a);
    func_8001EC20(board->unk14, b);
    if (board->unk18 != 0) {
        func_8001EC20(board->unk18, a + 1);
        func_8001EC20(board->unk18, b + 1);
    } else {
        func_8001EC20(board->unk14, a + 1);
        func_8001EC20(board->unk14, b + 1);
    }
    board->unk358 = 0;
}
